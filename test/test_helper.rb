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
  attr_accessor :errors, :property, :property_file_name

  def initialize(assert_valid = [])
    @errors = {}
    @asserts_valid = assert_valid
  end

  def valid?
    apply_errors
    @errors.empty?
  end

  private
  def apply_errors
    @asserts_valid.each do |prop|
      if self.send(prop).nil?
        @errors[:property] = String.new
      else
        @errors.delete(prop)
      end
    end
  end
end
