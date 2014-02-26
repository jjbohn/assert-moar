require 'simplecov'
SimpleCov.command_name 'test'
SimpleCov.start

require 'coveralls'
Coveralls.wear!

require 'minitest/autorun'
require 'mocha/mini_test'
require_relative '../lib/assert_moar'
require_relative 'support/active_model/validations'
require_relative 'support/active_record/validations'

class ActiveRecordDouble
  attr_accessor :valid, :error_map

  def self._validators
    @@error_map.inject({}) { |hash, (k, v)| hash.merge(k => Array(v.new)) }
  end

  def initialize(valid: false, error_map: {})
    @valid = valid
    @@error_map = error_map.to_h
  end

  def valid?
    @valid == true
  end
end
