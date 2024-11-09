# frozen_string_literal: true

# Создаем простые тэги тут
module TagFactory
  def p(content)
    "<p>#{content}</p>"
  end

  def a(href, text)
    "<a href='#{href}'>#{text}</a>"
  end

  def img(src, alt_text)
    "<img src='#{src}' alt='#{alt_text}'>"
  end

  def input(type, name, value = nil, params = {})
    "<input type='#{type}' name='#{name}' value='#{value}'#{format_attributes(params)}>"
  end

  def textarea(name, rows, cols, value = nil, params = {})
    "<textarea name='#{name}' rows='#{rows}' cols='#{cols}'#{format_attributes(params)}>#{value}</textarea>"
  end

  def label(for_id, text)
    "<label for='#{for_id}'>#{text}</label>"
  end

  def button(text)
    "<button>#{text}</button>"
  end

  def format_attributes(params)
    params.map { |key, value| " #{key}='#{value}'" }.join
  end
end
