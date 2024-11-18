# frozen_string_literal: true

module HexletCode
  class FormRenderer
    def self.render_html(form_body) # rubocop:disable Metrics/AbcSize
      action = form_body[:form_options][:action]
      method = form_body[:form_options][:method]
      class_attr = form_body[:form_options][:class] ? " class='#{form_body[:form_options][:class]}'" : ''

      form_start = "<form action='#{action}' method='#{method}'#{class_attr}>"
      form_content = form_body[:inputs].map { |tag_info| Tag.build(*tag_info) }.join
      form_submit = form_body[:submit][:value] ? Tag.build(:input, form_body[:submit]) : ''
      form_end = '</form>'

      form_start + form_content + form_submit + form_end
    end
  end
end
