# frozen_string_literal: true

require_relative 'log_parser/analyser'
require_relative 'log_parser/cli'
require_relative 'log_parser/validation'

# Base module
module LogParser
  STRATEGIES = %w[popularity popularity_uniquness].freeze

  class << self
    def root
      @root ||= File.expand_path File.dirname __dir__
    end
  end
end
