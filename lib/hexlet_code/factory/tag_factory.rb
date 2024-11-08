# frozen_string_literal: true

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

  def input(type, name, value = nil)
    "<input type='#{type}' name='#{name}' value='#{value}'>"
  end

  def label(for_id, text)
    "<label for='#{for_id}'>#{text}</label>"
  end

  def button(text)
    "<button>#{text}</button>"
  end
end
