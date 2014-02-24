require_relative '../../test_helper'

class AssertMoar::VersionTest < MiniTest::Test
  def test_version_defined
    refute_nil AssertMoar::VERSION
  end
end
