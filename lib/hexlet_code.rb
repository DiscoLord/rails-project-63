# frozen_string_literal: true

require_relative 'hexlet_code/version'

autoload :FormBuilder, 'hexlet_code/form_builder'
autoload :FormRenderer, 'hexlet_code/form_renderer'
autoload :Tag, 'hexlet_code/tag'

# Main module
module HexletCode
  class Error < StandardError; end

  def self.form_for(entity, attributes = {})
    builder = FormBuilder.new(entity, attributes)
    yield(builder) if block_given?

    FormRenderer.render_html(builder.form_body)
  end
end
