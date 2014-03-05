module AssertMoar::Assertions
  def assert_validates_presence_of(object, property)
    assert has_validator?(object, property, ::ActiveModel::Validations::PresenceValidator),
      "#{object} does not validate the presence of #{property}"
  end

  def refute_validates_presence_of(object, property)
    refute has_validator?(object, property, ::ActiveModel::Validations::PresenceValidator),
      "#{object} validates presence of #{property}"
  end

  def assert_validates_uniqueness_of(object, property)
    assert has_validator?(object, property, ::ActiveRecord::Validations::UniquenessValidator),
      "#{object} does not validate the presence of #{property}"
  end

  def refute_validates_uniqueness_of(object, property)
    refute has_validator?(object, property, ::ActiveRecord::Validations::UniquenessValidator),
      "#{object} validates presence of #{property}"
  end

  def assert_validates_absence_of(object, property)
    assert has_validator?(object, property, ::ActiveModel::Validations::AbsenceValidator),
      "#{object} does not validate the absence of #{property}"
  end

  def refute_validates_absence_of(object, property)
    refute has_validator?(object, property, ::ActiveModel::Validations::AbsenceValidator),
      "#{object} validates absence of #{property}"
  end

  def assert_validates_acceptance_of(object, property)
    assert has_validator?(object, property, ::ActiveModel::Validations::AcceptanceValidator),
      "#{object} does not validate the acceptance of #{property}"
  end

  def refute_validates_acceptance_of(object, property)
    refute has_validator?(object, property, ::ActiveModel::Validations::AcceptanceValidator),
      "#{object} validates the acceptance of #{property}"
  end

  def assert_validates_with_callback(object, callback)
    assert has_callback_validator?(object, callback),
      "#{object} does not validate with #{callback}"
  end

  def refute_validates_with_callback(object, callback)
    refute has_callback_validator?(object, callback),
      "#{object} does not validate with #{callback}"
  end

  def assert_valid(object)
    assert object.valid?, "Expected object to be valid"
  end

  def refute_valid object
    refute object.valid?, "Expected object to not be valid"
  end

  private
  def has_validator?(object_or_class, property, validator_class)
    klass = object_or_class.class
    property = property.to_sym
    validators = Array(klass._validators[property])

    validators.any? { |v| v.is_a?(validator_class) }
  end

  def has_callback_validator?(object_or_class, callback)
    klass = object_or_class.class

    klass._validate_callbacks.any? { |v| v.filter == callback }
  end
end
