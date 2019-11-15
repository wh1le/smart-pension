module LogParser
  module Statistics
    class Analyser
      def initialize(records:, strategy:)
        @records = records
        @strategy = strategy
      end

      def perform
        strategy.new(records: @records).perform
      end

      private

      def strategy
        case @strategy
        when 'popularity'
          Strategies::Popularity
        when 'popularity_uniquness'
          Strategies::PopularityUniquness
        else
          raise StrategyInvalid
        end
      end
    end
  end
end
