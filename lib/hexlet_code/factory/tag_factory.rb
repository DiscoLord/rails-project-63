# frozen_string_literal: true

# Создаем простые тэги тут
class TagFactory

  attr_reader :form_string

  def initialize(field_object)
    @field_object = field_object
    @form_string = ''
  end
  
  def p(content)
    @form_string += "<p>#{content}</p>"
  end

  def a(href, text)
    @form_string += "<a href='#{href}'>#{text}</a>"
  end

  def img(src, alt_text)
    @form_string += "<img src='#{src}' alt='#{alt_text}'>"
  end

  def generic_input(name, **args)
    as = args[:as]
    if as == :text
      input :text, name, args[:value], **args.except(:as, :value)
    elsif as == :textarea
      textarea(name, args[:rows] || 4, args[:cols] || 40, args[:value], args.except(:as, :rows, :cols, :value))
    elsif as == :submit
      submit(args[:value])
    else
      @form_string
    end
  end

  def input(type, name, value = nil, **params)
    @field_object.public_send name
    label(name, name.capitalize)
    @form_string += "<input type='#{type}' name='#{name}' value='#{value}'#{format_attributes(params)}>"
  end

  def textarea(name, rows, cols, value = nil, params = {})
    @field_object.public_send name
    label(name, name.capitalize)
    @form_string += "<textarea name='#{name}' rows='#{rows}' cols='#{cols}'#{format_attributes(params)}>#{value}</textarea>"
  end

  def submit(text)
    @form_string += "<input type='submit' value='#{text}'>"
  end

  def label(for_id, text)
    @form_string += "<label for='#{for_id}'>#{text}</label>"
  end

  def button(text)
    @form_string += "<button>#{text}</button>"
  end

  private
  
  def format_attributes(params)
    params.map { |key, value| " #{key}='#{value}'" }.join
  end
end
