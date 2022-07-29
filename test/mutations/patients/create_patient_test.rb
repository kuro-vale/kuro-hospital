# frozen_string_literal: true

require 'test_helper'

class CreatePatientTest < ActiveSupport::TestCase
  setup do
    @doctor = doctors(:one)
  end

  def perform(doctor:, **args)
    Mutations::Patients::CreatePatient.new(object: nil, field: nil, context: { current_user: doctor }).resolve(**args)
  end

  test 'should create a new patient' do
    payload = perform(
      doctor: @doctor,
      name: 'Julian',
      age: 21,
      gender: 'X'
    )

    assert payload.persisted?
    assert_equal payload.name, 'Julian'
    assert_equal payload.age, 21
    assert_equal payload.gender, 'X'
  end

  test 'should not create a new patient if not logged' do
    assert_raise(Exceptions::AuthenticationError) do
      perform(
        doctor: nil,
        name: 'Julian',
        age: 21,
        gender: 'X'
      )
    end
  end
end
