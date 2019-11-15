# frozen_string_literal: true

module LogParser
  module Factories
    class StrategyFactory
      def self.build(strategy)
        camelized = strategy.split('_').map(&:capitalize).join

        Statistics::Strategies.const_get(camelized)
      end
    end
  end
end
