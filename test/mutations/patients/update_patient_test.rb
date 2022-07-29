# frozen_string_literal: true

require 'test_helper'

class UpdatePatientTest < ActiveSupport::TestCase
  setup do
    @doctor = doctors(:one)
    @patient = patients(:one)
  end

  def perform(doctor:, **args)
    Mutations::Patients::UpdatePatient.new(object: nil, field: nil, context: { current_user: doctor }).resolve(**args)
  end

  test 'should update a patient' do
    perform(
      doctor: @doctor,
      id: @patient.id,
      name: 'Michelle',
      age: 22,
      gender: 'F'
    )

    patient = Patient.find(@patient.id)

    assert_equal patient.name, 'Michelle'
    assert_equal patient.age, 22
    assert_equal patient.gender, 'F'
  end

  test 'should update a patient name' do
    perform(
      doctor: @doctor,
      id: @patient.id,
      name: 'Michelle'
    )

    patient = Patient.find(@patient.id)

    assert_equal patient.name, 'Michelle'
    assert_equal patient.age, @patient.age
    assert_equal patient.gender, @patient.gender
  end

  test 'should update a patient age' do
    perform(
      doctor: @doctor,
      id: @patient.id,
      age: 25
    )

    patient = Patient.find(@patient.id)

    assert_equal patient.name, @patient.name
    assert_equal patient.age, 25
    assert_equal patient.gender, @patient.gender
  end

  test 'should update a patient gender' do
    perform(
      doctor: @doctor,
      id: @patient.id,
      gender: 'M'
    )

    patient = Patient.find(@patient.id)

    assert_equal patient.name, @patient.name
    assert_equal patient.age, @patient.age
    assert_equal patient.gender, 'M'
  end

  test 'should not update a patient if not logged' do
    assert_raise(Exceptions::AuthenticationError) do
      perform(
        doctor: nil,
        id: @patient.id,
        name: 'Michelle',
        age: 22,
        gender: 'F'
      )
    end
  end
end
