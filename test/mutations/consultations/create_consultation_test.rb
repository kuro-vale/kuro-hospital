# frozen_string_literal: true

require 'test_helper'

class CreateConsultationTest < ActiveSupport::TestCase
  setup do
    @doctor = doctors(:one)
  end

  def perform(doctor:, **args)
    Mutations::Consultations::CreateConsultation.new(object: nil, field: nil,
                                                     context: { current_user: doctor }).resolve(**args)
  end

  test 'should create a new consultation' do
    payload = perform(
      doctor: @doctor,
      diagnosis: 'MyDiagnosis',
      procedure: 'YourProcedure',
      ids_input: {
        patient_id: 1,
        drug_id: 1
      }
    )

    assert payload.persisted?
    assert_equal payload.diagnosis, 'MyDiagnosis'
    assert_equal payload.procedure, 'YourProcedure'
  end

  test 'should not create a new consultation if not logged' do
    assert_raise(Exceptions::AuthenticationError) do
      perform(
        doctor: nil,
        diagnosis: 'MyDiagnosis',
        procedure: 'YourProcedure',
        ids_input: {
          patient_id: 1,
          drug_id: 1
        }
      )
    end
  end
end
