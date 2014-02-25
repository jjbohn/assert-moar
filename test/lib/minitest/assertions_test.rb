require_relative '../../test_helper'

class Minitest::AssertionTest < Minitest::Test
  def setup
    super

    Minitest::Test.reset

    @tc = Minitest::Test.new('foo')
    @assertion_count = 1
  end

  def test_assert_valid
    double = spy
    double.property = "foo"
    @tc.assert_valid double
  end

  def test_refute_valid
    @tc.refute_valid spy(:property)
  end

  def test_assert_validates_presence_of
    @assertion_count = 3
    double = spy(:property)
    double.property = "foo"
    @tc.assert_validates_presence_of(double, :property)
    assert_equal "foo", double.property
  end

  def test_refute_validates_presence_of
    @assertion_count = 3
    @tc.refute_validates_presence_of(spy, :property)
  end

  def test_assert_validates_attachment_presence_of
    @assertion_count = 3
    double = spy(:property_file_name)
    double.property_file_name = "foo.png"
    @tc.assert_validates_attachment_presence_of(double, :property)
  end

  def test_refute_validates_attachment_presence_of
    @assertion_count = 3
    @tc.refute_validates_attachment_presence_of(spy, :property)
  end

  def teardown
    assert_equal(@assertion_count, @tc.assertions,
                 "expected #{@assertion_count} assertions to be fired during the test, not #{@tc.assertions}") if @tc.passed?
  end

  private

  def spy(assert_valid = nil)
    ActiveRecordSpy.new(assert_valid)
  end
end
