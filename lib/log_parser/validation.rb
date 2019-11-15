# frozen_string_literal: true

require_relative './validation/log_file'

module LogParser
  module Validation
    LogFileInvalidError = Class.new(StandardError)
  end
end
