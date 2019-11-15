# frozen_string_literal: true

module LogParser
  class Processor
    def initialize(filepath:, strategy:)
      @filepath = filepath
      @strategy_name = strategy

      validate_options
    end

    def analytics
      records = loader.new(filepath: @filepath).records

      result = analyzer.new(
        records: records,
        strategy: strategy
      ).perform_strategy

      presenter.new(
        result: result,
        strategy: strategy
      ).report_to_stdout
    end

    private

    def validate_options
      Validation::LogFile.new(filepath: @filepath).perform!

      raise StrategyInvalid unless STRATEGIES.include?(@strategy_name)
    end

    def loader
      Data::Loader
    end

    def analyzer
      Statistics::Analyser
    end

    def presenter
      Statistics::Presenter
    end

    def strategy
      Factories::StrategyFactory.build(@strategy_name)
    end
  end
end
