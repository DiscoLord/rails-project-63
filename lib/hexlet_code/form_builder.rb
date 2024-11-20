# frozen_string_literal: true

module HexletCode
  class FormBuilder
    attr_reader :form_body

    def initialize(field_object, attributes = {})
      @field_object = field_object
      action = attributes.fetch :url, '#'
      method = attributes.fetch :method, 'post'
      @form_body = {
        inputs: [],
        submit: { options: nil },
        form_options: { action: action, method: method }.merge(attributes.except(:url, :method))
      }
    end

    def input(name, **args)
      case args[:as]
      when :textarea, :text
        textarea(name, args[:value], args.except(:as, :value))
      when :submit
        submit(args[:value] || 'Save')
      else
        input_tag(name, args[:as], args[:value], **args.except(:as, :value))
      end
    end

    def input_tag(name, type, value, **params)
      value = @field_object.public_send(name) if value.nil?
      @form_body[:inputs] << Inputs::StringInput.new(name, type: type, value: value, **params)
    end

    def textarea(name, value, params = {})
      value = @field_object.public_send(name) if value.nil?
      @form_body[:inputs] << Inputs::TextInput.new(name, value: value, **params)
    end

    def submit(text = 'Save')
      @form_body[:submit] = { type: 'submit', value: text }
    end
  end
end
