module LogParser
  module Statistics
    class Analyzer
      def initialize(records:, strategy:)
        @records = records
        @strategy = strategy
      end

      def perform
        strategy.perform
      end

      private

      def strategy
        # case @strategy
        # when 'popularity'
        # end
      end
    end
  end
end
