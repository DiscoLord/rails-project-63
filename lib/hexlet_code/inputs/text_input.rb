# frozen_string_literal: true

module HexletCode
  module Inputs
    class TextInput < BaseInput
      TAG_NAME = 'textarea'
      DEFAULT_VALUE = ''
      ROWS = 20
      COLS = 40

      def initialize(name, **params)
        super
        @params[:rows] ||= ROWS
        @params[:cols] ||= COLS
      end

      def build_tag
        "<label for='#{name}'>#{name.capitalize}</label>" \
          "<#{TAG_NAME} name='#{name}'#{attributes}>#{value}</#{TAG_NAME}>"
      end

      private

      def attributes
        params.map { |key, value| " #{key}='#{value}'" }.join
      end
    end
  end
end
