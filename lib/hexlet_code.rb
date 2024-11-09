# frozen_string_literal: true

require_relative 'hexlet_code/version'
require_relative 'hexlet_code/models/user'

autoload :TagFactory, 'hexlet_code/factory/tag_factory'

# Main module
module HexletCode
  extend TagFactory

  class Error < StandardError; end

  def self.form_for(user, args = {})
    param_class = param_or_empty args[:class], 'class'
    form = "<form action='#{args[:url] || '#'}' method='post'#{param_class}>"

    form += input :text, :name, user.name, class: 'user-input'
    form += textarea :job, 50, 50, user.job

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
