# frozen_string_literal: true

module LogParser
  class CLI
    NoOptionsError = Class.new(StandardError)

    class << self
      def parse_options(arguments = [])
        raise NoOptionsError if arguments.empty?

        {
          filepath: arguments[0],
          strategy: arguments[1]
        }
      end

      def start(options)
        LogParser::Analyser.new(options).process
      end
    end
  end
end
