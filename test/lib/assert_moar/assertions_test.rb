require_relative '../../test_helper'

class AssertMoar::AssertionTest < Minitest::Test
  def setup
    super

    Minitest::Test.reset

    @tc = Minitest::Test.new('foo')
    @tc.send(:extend, AssertMoar::Assertions)
    @assertion_count = 1
  end

  def test_assert_valid
    @tc.assert_valid ActiveRecordDouble.new(valid: true)
  end

  def test_refute_valid
    @tc.refute_valid ActiveRecordDouble.new(valid: false)
  end

  def test_assert_validates_presence_of
    validator = ::ActiveModel::Validations::PresenceValidator
    double = ActiveRecordDouble.new(error_map: { property: validator })
    @tc.assert_validates_presence_of(double, :property)
  end

  def test_refute_validates_presence_of
    double = ActiveRecordDouble.new()
    @tc.refute_validates_presence_of(double, :property)
  end

  def test_assert_uniqueness_of
    validator = ::ActiveRecord::Validations::UniquenessValidator
    double = ActiveRecordDouble.new(error_map: { property: validator })
    @tc.assert_validates_uniqueness_of(double, :property)
  end

  def test_refute_uniqueness_of
    double = ActiveRecordDouble.new()
    @tc.refute_validates_uniqueness_of(double, :property)
  end

  def test_assert_validates_absence_of
    validator = ::ActiveModel::Validations::AbsenceValidator
    double = ActiveRecordDouble.new(error_map: {property: validator })
    @tc.assert_validates_absence_of(double, :property)
  end

  def test_refute_validates_absense_of
    double = ActiveRecordDouble.new()
    @tc.refute_validates_absence_of(double, :property)
  end

  def teardown
    assert_equal(@assertion_count, @tc.assertions,
                 "expected #{@assertion_count} assertions to be fired during the test, not #{@tc.assertions}") if @tc.passed?
  end
end
