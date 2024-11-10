# frozen_string_literal: true

require_relative 'hexlet_code/version'
require_relative 'hexlet_code/models/user'

autoload :TagFactory, 'hexlet_code/factory/tag_factory'

# Main module
module HexletCode
  class Error < StandardError; end

  def self.form_for(user, args = {})
    param_class = param_or_empty(args[:class], 'class')
    form = "<form action='#{args[:url] || '#'}' method='#{args[:method] || 'post'}'#{param_class}>"

    factory = TagFactory.new(user)

    form += yield(factory) if block_given?

    form += '</form>'
    form
  end

  def self.param_or_empty(param, name)
    if param
      " #{name}='#{param}'"
    else
      ''
    end
  end
end
