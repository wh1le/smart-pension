# frozen_string_literal: true

require_relative './model/log_record'

module LogParser
  module Data
    module Model
      AttributeIsEmpty = Class.new(StandardError)
      InvalidIpAddress = Class.new(StandardError)
    end
  end
end
