# frozen_string_literal: true

module LogParser
  class Analyser
    def initialize(filepath:, strategy:)
      @filepath = filepath
      @strategy = strategy

      validate!
    end

    def process
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
