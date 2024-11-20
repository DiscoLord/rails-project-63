# frozen_string_literal: true

module HexletCode
  module Inputs
    class StringInput < BaseInput
      TAG_NAME = 'input'
      DEFAULT_VALUE = ''
      DEFAULT_TYPE = 'text'

      def initialize(name, **params)
        @type = params[:type] || DEFAULT_TYPE
        super(name, **params.except(:type))
      end

      def build_tag
        "<label for='#{name}'>#{name.capitalize}</label>" \
          "<#{TAG_NAME} type='#{@type}' name='#{name}' value='#{value}'#{attributes}>"
      end

      private

      def attributes
        params.map { |key, value| " #{key}='#{value}'" }.join
      end
    end
  end
end
