# frozen_string_literal: true

module LogParser
  class Processor
    def initialize(filepath:, strategy:)
      @filepath = filepath
      @strategy = strategy

      validate!
    end

    def perform
      # load_file
      # format_data
      # apply_sotring_strategy
      # present
    end

    private

    def validate!
      LogParser::Validation::LogFile.new(filepath: @filepath).perform!
    end
  end
end
