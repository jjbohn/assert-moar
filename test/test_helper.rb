require 'simplecov'
SimpleCov.command_name 'test'
SimpleCov.start

require 'coveralls'
Coveralls.wear!

require 'minitest/autorun'
require 'mocha/mini_test'
require_relative '../lib/minitest/assertions'
require_relative '../lib/assert_moar'

class ActiveRecordBaseDouble
  attr_accessor :errors, :property

  def initialize(assert_valid = true)
    @errors = {}
    @assert_valid = assert_valid
  end

  def property=(value)
    @property = value
    @errors[:property] = value.nil? ? String.new : nil if asserts_valid?
  end

  def valid?
    !@property.nil? || !asserts_valid?
  end

  def asserts_valid?
    @assert_valid == true
  end
end
