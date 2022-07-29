# frozen_string_literal: true

require 'test_helper'

class DeletePatientTest < ActiveSupport::TestCase
  setup do
    @doctor = doctors(:one)
    @patient = patients(:one)
  end

  def perform(doctor:, **args)
    Mutations::Patients::DeletePatient.new(object: nil, field: nil, context: { current_user: doctor }).resolve(**args)
  end

  test 'should delete a patient' do
    assert_difference('Patient.count', -1) do
      perform(doctor: @doctor, id: @patient.id)
    end
  end

  test 'should not delete a patient if not logged' do
    assert_raise(Exceptions::AuthenticationError) do
      perform(doctor: nil, id: @patient.id)
    end
  end
end
