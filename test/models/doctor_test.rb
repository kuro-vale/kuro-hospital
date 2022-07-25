# frozen_string_literal: true

require 'test_helper'

class DoctorTest < ActiveSupport::TestCase
  test 'should not save an empty doctor' do
    doctor = Doctor.new
    assert_not doctor.valid?
    assert_not_nil doctor.errors[:name], 'no validation error for name present'
    assert_not_nil doctor.errors[:university], 'no validation error for university present'
  end

  test 'should not save a doctor with fields greater than 50' do
    doctor = Doctor.new(name: 'a' * 51, university: 'a' * 51)
    assert_not doctor.valid?, 'doctor is valid with fields character greater than 50'
  end

  test 'valid doctor' do
    doctor = Doctor.new(name: 'Julian', university: 'Cambridge')
    assert doctor.valid?
  end
end
