# frozen_string_literal: true

require_relative 'hexlet_code/version'

autoload :TagFactory, 'hexlet_code/factory/tag_factory'

module HexletCode
  class Error < StandardError; end

  def self.form_for(user, args = {})
    param_class = if args[:class]
      " class=\"#{args[:class]}\""
    else
      ''
    end
    url = args[:url] || '#'
    tag = "<form action=\"#{url}\" method=\"post\""
    tag += param_class
    tag += "></form>"
    tag
  end
end
