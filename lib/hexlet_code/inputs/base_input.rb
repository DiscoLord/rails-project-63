# frozen_string_literal: true

module HexletCode
  module Inputs
    class BaseInput
      attr_reader :name, :value, :params

      DEFAULT_VALUE = nil

      def initialize(name, **params)
        @name = name
        @value = params.fetch(:value, DEFAULT_VALUE)
        @params = params.except(:value)
      end

      def build_tag
        raise NotImplementedError, 'Subclasses must implement the build_tag method'
      end
    end
  end
end
