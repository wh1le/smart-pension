# frozen_string_literal: true

module LogParser
  class Processor
    def initialize(filepath:, strategy:)
      @filepath = filepath
      @strategy = strategy
    end

    def get_analytics
      records = loader.new(filepath: @filepath).records
      result = analyzer.new(records: records, strategy: @strategy).perform_strategy
      presenter.new(result: result, strategy: @strategy).report_to_stdout
    end

    private

    def validate_options
      Validation::LogFile.new(filepath: @filepath).perform!

      raise StrategyInvalid unless STRATEGIES.include?(@strategy)
    end

    def loader
      Data::Loader
    end

    def analyzer
      Statistics::Analyser
    end

    def presenter; end
  end
end
