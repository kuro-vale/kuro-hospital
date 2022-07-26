# frozen_string_literal: true

require 'test_helper'

class DoctorTest < ActiveSupport::TestCase
  test 'should not save an empty doctor' do
    doctor = Doctor.new
    assert_not doctor.valid?
    assert_not_empty doctor.errors[:name], 'no validation error for name present'
    assert_not_empty doctor.errors[:university], 'no validation error for university present'
    assert_not_empty doctor.errors[:username], 'no validation error for username present'
    assert_not_empty doctor.errors[:password], 'no validation error for password present'
  end

  test 'should not save a doctor with fields greater than 50' do
    doctor = Doctor.new(name: 'a' * 51, university: 'a' * 51, username: 'a' * 51, password: '123')
    assert_not doctor.valid?, 'doctor is valid with fields character greater than 50'
    assert_not_empty doctor.errors[:name], 'no validation error for name greater than 50'
    assert_not_empty doctor.errors[:university], 'no validation error for university greater than 50'
    assert_not_empty doctor.errors[:username], 'no validation error for username greater than 50'
  end

  test 'valid doctor' do
    doctor = Doctor.new(name: 'Julian', university: 'Cambridge', username: 'kuro', password: '123')
    assert doctor.valid?
  end
end
