module MiniTest::Assertions
  def assert_validates_presence_of(object, property)
    assert_valid(object)
    object.send("#{property}=", nil)
    refute object.valid?, "Expected object not to be valid"
    assert object.errors[property.to_sym], "Expected errors to exist for #{property}"
  end

  def refute_validates_presence_of(object, property)
    assert_valid(object)
    object.send("#{property}=", nil)
    assert_valid(object)
    assert_nil object.errors[property.to_sym]
  end

  def assert_valid(object)
    assert object.valid?, "Expected object to be valid"
  end

  def refute_valid(object)
    refute object.valid?, "Expected object to not be valid"
  end
end
