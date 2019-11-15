# frozen_string_literal: true

module LogParser
  module Data
    class Loader
      def initialize(filepath:)
        @filepath = filepath
      end

      def records
        serializer.new(data).serialize_to_objects
      end

      private

      def data
        File.open(@filepath, 'r').read
      end

      def serializer
        Serializer
      end
    end
  end
end
