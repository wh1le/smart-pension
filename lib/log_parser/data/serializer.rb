# frozen_string_literal: true

module LogParser
  module Data
    class Serializer
      def initialize(data)
        @data = data
      end

      def serialize_to_objects
        formatted_data.map do |row|
          model.new(*row.split)
        end
      end

      private

      def formatted_data
        @data.split("\n")
      end

      def model
        Model::LogRecord
      end
    end
  end
end
