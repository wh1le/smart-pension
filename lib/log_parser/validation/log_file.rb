# frozen_string_literal: true

module LogParser
  module Validation
    class LogFile
      attr_reader :messages

      def initialize(filepath:)
        @messages = []
        @filepath = filepath
      end

      def perform!
        return true if file_exists? && extension_valid? && content_present?

        raise Validation::LogFileInvalidError, @messages
      end

      private

      def file_exists?
        file
      rescue Errno::ENOENT
        add_message(:not_exists)
        false
      end

      def extension_valid?
        result = file_extension == 'log'

        add_message(:bad_extension) unless result

        result
      end

      def content_present?
        result = !file.read.empty?

        add_message(:empty) unless result

        result
      end

      def file
        @file ||= File.open(@filepath, 'r')
      end

      def file_extension
        @filepath.split('.').last
      end

      def add_message(type)
        @messages.push(message_dictionary(type))
      end

      def message_dictionary(error_type)
        {
          bad_extension: 'Extension is not valid.',
          empty: 'Content is empty',
          not_exists: 'File doesn\'t exist'
        }[error_type]
      end
    end
  end
end
