# frozen_string_literal: true

require 'test_helper'

class UpdateDoctorTest < ActiveSupport::TestCase
  setup do
    @doctor = doctors(:one)
  end

  def perform(**args)
    Mutations::UpdateDoctor.new(object: nil, field: nil, context: {}).resolve(**args)
  end

  test 'should update a doctor' do
    perform(
      id: @doctor.id,
      update_profile_input: {
        name: 'Julian',
        university: 'Cambridge'
      },
      username: 'kuro'
    )

    doctor = Doctor.find(@doctor.id)

    assert_equal doctor.name, 'Julian'
    assert_equal doctor.university, 'Cambridge'
    assert_equal doctor.username, 'kuro'
  end

  test 'should update a doctor name' do
    perform(
      id: @doctor.id,
      update_profile_input: {
        name: 'Julian'
      }
    )

    doctor = Doctor.find(@doctor.id)

    assert_equal doctor.name, 'Julian'
    assert_equal doctor.university, @doctor.university
    assert_equal doctor.username, @doctor.username
  end

  test 'should update a doctor university' do
    perform(
      id: @doctor.id,
      update_profile_input: {
        university: 'Cambridge'
      }
    )

    doctor = Doctor.find(@doctor.id)

    assert_equal doctor.name, @doctor.name
    assert_equal doctor.university, 'Cambridge'
    assert_equal doctor.username, @doctor.username
  end

  test 'should update a doctor username' do
    perform(
      id: @doctor.id,
      username: 'kuro'
    )

    doctor = Doctor.find(@doctor.id)

    assert_equal doctor.name, @doctor.name
    assert_equal doctor.university, @doctor.university
    assert_equal doctor.username, 'kuro'
  end
end
