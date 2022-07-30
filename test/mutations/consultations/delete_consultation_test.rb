# frozen_string_literal: true

require 'test_helper'

class DeleteConsultationTest < ActiveSupport::TestCase
  setup do
    @doctor = doctors(:one)
    @unauthorized_doctor = doctors(:two)
    @consultation = consultations(:one)
  end

  def perform(doctor:, **args)
    Mutations::Consultations::DeleteConsultation.new(object: nil, field: nil,
                                                     context: { current_user: doctor }).resolve(**args)
  end

  test 'should delete a consultation' do
    assert_difference('Consultation.count', -1) do
      perform(doctor: @doctor, id: @consultation.id)
    end
  end

  test 'should not delete a consultation if not logged' do
    assert_raise(Exceptions::AuthenticationError) do
      perform(doctor: nil, id: @consultation.id)
    end
  end

  test 'should not delete a consultation if doctor not made the consultation' do
    assert_raise(Exceptions::AuthorizationError) do
      perform(doctor: @unauthorized_doctor, id: @consultation.id)
    end
  end
end
