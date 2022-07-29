# frozen_string_literal: true

require 'test_helper'

class UpdateDoctorTest < ActiveSupport::TestCase
  setup do
    @doctor = doctors(:one)
  end

  def perform(doctor:, **args)
    Mutations::Doctors::UpdateDoctor.new(object: nil, field: nil, context: { current_user: doctor }).resolve(**args)
  end

  test 'should update a doctor' do
    perform(
      doctor: @doctor,
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
      doctor: @doctor,
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
      doctor: @doctor,
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
      doctor: @doctor,
      username: 'kuro'
    )

    doctor = Doctor.find(@doctor.id)

    assert_equal doctor.name, @doctor.name
    assert_equal doctor.university, @doctor.university
    assert_equal doctor.username, 'kuro'
  end

  test 'should not update a doctor if not logged' do
    assert_raise(Exceptions::AuthenticationError) do
      perform(
        doctor: nil,
        update_profile_input: {
          name: 'Julian',
          university: 'Cambridge'
        },
        username: 'kuro'
      )
    end
  end
end
