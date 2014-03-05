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
require_relative 'support/active_support/callbacks'

class ActiveRecordDouble
  attr_accessor :valid, :error_map

  def self._validators
    @@error_map.inject({}) { |hash, (k, v)| hash.merge(k => Array(v.new)) }
  end

  def self._validate_callbacks
    Array(@@error_map[:callback])
  end

  def initialize(valid: false, error_map: {})
    @valid = valid
    @@error_map = error_map.to_h
  end

  def memoized_method
    @object ||= BasicObject.new
  end

  def non_memoized_method
    BasicObject.new
  end

  def valid?
    @valid == true
  end
end
