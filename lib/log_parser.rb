# frozen_string_literal: true

require_relative 'log_parser/cli'
require_relative 'log_parser/data'
require_relative 'log_parser/processor'
require_relative 'log_parser/statistics'
require_relative 'log_parser/validation'

# Base module
module LogParser
  STRATEGIES = %w[popularity popularity_uniquness].freeze
  StrategyInvalid = Class.new(StandardError)

  class << self
    def root
      @root ||= File.expand_path File.dirname __dir__
    end
  end
end
