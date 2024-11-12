# frozen_string_literal: true

require_relative 'tag'

class FormRenderer
  def self.render_html(form_body, attributes = {})
    action = attributes[:url] || '#'
    method = attributes[:method] || 'post'
    class_attr = attributes[:class] ? " class='#{attributes[:class]}'" : ''

    form_start = "<form action='#{action}' method='#{method}'#{class_attr}>"
    form_content = form_body.map { |tag_info| Tag.build(*tag_info) }.join
    form_end = '</form>'

    form_start + form_content + form_end
  end
end
