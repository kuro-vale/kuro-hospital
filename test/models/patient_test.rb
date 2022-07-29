# frozen_string_literal: true

require 'test_helper'

class PatientTest < ActiveSupport::TestCase
  test 'should not save an empty patient' do
    patient = Patient.new
    assert_not patient.valid?
    assert_not_empty patient.errors[:name], 'no validation error for name present'
    assert_not_empty patient.errors[:age], 'no validation error for age present'
    assert_not_empty patient.errors[:gender], 'no validation error for gender present'
  end

  test 'should not save a patient with name greater than 50' do
    patient = Patient.new(name: 'a' * 51, age: 20, gender: 'X')
    assert_not patient.valid?
    assert_not_empty patient.errors[:name], 'no validation error for name greater than 50'
  end

  test 'should not save a patient with age less than 18 or greater than 90' do
    minor_patient = Patient.new(name: 'Minor', age: 17, gender: 'M')
    assert_not minor_patient.valid?, 'patient is valid with age less than 18'
    assert_not_empty minor_patient.errors[:age], 'no validation error for age less than 18'
    old_patient = Patient.new(name: 'Old', age: 91, gender: 'F')
    assert_not old_patient.valid?, 'patient is valid with age greater than 90'
    assert_not_empty old_patient.errors[:age], 'no validation error for age greater than 90'
  end

  test 'should not save a patient with invalid gender' do
    patient = Patient.new(name: 'Julian', age: 21, gender: 'Queer')
    assert_not patient.valid?
    assert_not_empty patient.errors[:gender], 'no validation error for gender not in list'
  end

  test 'valid Patient' do
    patient = Patient.new(name: 'Julian', age: 21, gender: 'X')
    assert patient.valid?
  end
end
