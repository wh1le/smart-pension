# frozen_string_literal: true

module LogParser
  module Statistics
    module Strategies
      class PopularityUniquness
        def self.message(path, quantity)
          "#{path} #{quantity} unique visits"
        end

        def initialize(records:)
          @records = records
        end

        def perform(result = {})
          grouped = @records.group_by(&:url)

          grouped.keys.each do |key|
            result[key] = grouped[key].uniq.length
          end

          result.sort_by(&:last).reverse
        end
      end
    end
  end
end
