# frozen_string_literal: true

require_relative 'hexlet_code/version'

# Main module
module HexletCode
  autoload :FormBuilder, 'hexlet_code/form_builder'
  autoload :FormRenderer, 'hexlet_code/form_renderer'
  autoload :Tag, 'hexlet_code/tag'
  autoload :Inputs, 'hexlet_code/inputs'

  class Error < StandardError; end

  def self.form_for(entity, attributes = {})
    builder = FormBuilder.new(entity, attributes)
    yield(builder) if block_given?

    FormRenderer.render_html(builder.form_body)
  end
end
