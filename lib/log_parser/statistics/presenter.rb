# frozen_string_literal: true

module LogParser
  module Statistics
    class Presenter
      def initialize(result:, strategy:)
        @result = result
        @strategy = strategy
      end

      def report_to_stdout
        puts report
      end

      private

      def report
        @result.map do |data|
          @strategy.message(*data)
        end.join("\n")
      end
    end
  end
end
