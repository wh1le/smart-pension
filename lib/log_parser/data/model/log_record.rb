# frozen_string_literal: true

module LogParser
  module Data
    module Model
      LogRecord = Struct.new(:url, :ip) do
        def initialize(*args)
          super(*args)
          validate!(*args)
        end

        private

        def validate!(url, ip)
          raise AttributeIsEmpty if url.empty? || ip.empty?
          raise InvalidIpAddress if ip.split('.').size != 4
        end
      end
    end
  end
end
