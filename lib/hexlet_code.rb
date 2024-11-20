# frozen_string_literal: true

require_relative 'hexlet_code/version'

require_relative 'hexlet_code/form_builder'
require_relative 'hexlet_code/form_renderer'
require_relative 'hexlet_code/tag'
require_relative 'hexlet_code/inputs'

# Main module
module HexletCode
  class Error < StandardError; end

  def self.form_for(entity, attributes = {})
    builder = FormBuilder.new(entity, attributes)
    yield(builder) if block_given?

    FormRenderer.render_html(builder.form_body)
  end
end
