require_relative '../../test_helper'

class Minitest::AssertionTest < Minitest::Test
  def setup
    super

    Minitest::Test.reset

    @tc = Minitest::Test.new('foo')
    @assertion_count = 1
  end

  def test_assert_valid
    double = ActiveRecordBaseDouble.new
    double.property = "foo"
    @tc.assert_valid double
  end

  def test_refute_valid
    @tc.refute_valid ActiveRecordBaseDouble.new
  end

  def test_assert_validates_presence_of
    @assertion_count = 3
    double = ActiveRecordBaseDouble.new
    double.property = "foo"
    @tc.assert_validates_presence_of(double, :property)
    assert_equal "foo", double.property
  end

  def test_refute_validates_presence_of
    @assertion_count = 3
    @tc.refute_validates_presence_of(ActiveRecordBaseDouble.new(false), :property)
  end

  def teardown
    assert_equal(@assertion_count, @tc.assertions,
                 "expected #{@assertion_count} assertions to be fired during the test, not #{@tc.assertions}") if @tc.passed?
  end
end
