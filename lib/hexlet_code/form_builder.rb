# frozen_string_literal: true

module HexletCode
  class FormBuilder
    attr_reader :form_body

    def initialize(field_object, attributes = {})
      @field_object = field_object
      @attributes = attributes
      @form_body = []
    end

    def input(name, **args)
      case args[:as]
      when :textarea, :text
        textarea(name, args[:rows] || 20, args[:cols] || 40, args[:value], args.except(:as, :rows, :cols, :value))
      when :submit
        submit(args[:value] || 'Save')
      else
        input_tag(args[:as] || :text, name, args[:value], **args.except(:as, :value))
      end
    end

    def input_tag(type, name, value = nil, **params)
      value = @field_object.public_send(name) if value.nil?
      label(name, name.capitalize)
      @form_body << [:input, { type: type, name: name, value: value, **params }]
    end

    def textarea(name, rows, cols, value = nil, params = {})
      value = @field_object.public_send(name) if value.nil?
      label(name, name.capitalize)
      @form_body << [:textarea, { name: name, rows: rows, cols: cols, content: value, **params }]
    end

    def submit(text = 'Save')
      @form_body << [:input, { type: 'submit', value: text }]
    end

    def label(for_id, text)
      @form_body << [:label, { for: for_id, content: text }]
    end
  end
end
