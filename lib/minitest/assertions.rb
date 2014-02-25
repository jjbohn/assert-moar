module MiniTest::Assertions
  def assert_validates_presence_of(object, property)
    assert_valid(object)
    tmp = object.send("#{property}")
    object.send("#{property}=", nil)
    refute object.valid?, "Expected object not to be valid"
    assert object.errors[property.to_sym], "Expected errors to exist for #{property}"
    object.send("#{property}=", tmp)
  end

  def refute_validates_presence_of(object, property)
    assert_valid(object)
    tmp = object.send("#{property}")
    object.send("#{property}=", nil)
    assert_valid(object)
    assert_nil object.errors[property.to_sym]
    object.send("#{property}=", tmp)
  end

  def assert_validates_attachment_presence_of(object, property)
    assert_valid(object)
    tmp = object.send("#{property}_file_name")
    object.send("#{property}_file_name=", nil)
    refute object.valid?, "Expected object not to be valid"
    assert object.errors[property.to_sym], "Expected errors to exist for #{property}"
    object.send("#{property}_file_name=", tmp)
  end

  def refute_validates_attachment_presence_of(object, property)
    assert_valid(object)
    tmp = object.send("#{property}_file_name")
    object.send("#{property}_file_name=", nil)
    assert_valid(object)
    assert_nil object.errors[property.to_sym]
    object.send("#{property}_file_name=", tmp)
  end

  def assert_valid(object)
    assert object.valid?, "Expected object to be valid"
  end

  def refute_valid(object)
    refute object.valid?, "Expected object to not be valid"
  end
end
