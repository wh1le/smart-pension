# frozen_string_literal: true

module LogParser
  module Statistics
    class Analyser
      def initialize(records:, strategy:)
        @records = records
        @strategy = strategy
      end

      def perform_strategy
        @strategy.new(records: @records).perform
      end
    end
  end
end
