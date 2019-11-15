module LogParser
  class CLI
    NoOptionsError = Class.new(StandardError)

    class << self
      def parse_options(arguments)
        raise NoOptionsError if arguments.empty?
      end

      def start(options)
      end
    end
  end
end
