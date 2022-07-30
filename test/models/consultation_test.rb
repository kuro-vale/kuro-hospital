# frozen_string_literal: true

require 'test_helper'

class ConsultationTest < ActiveSupport::TestCase
  setup do
    @drug = drugs(:one)
    @doctor = doctors(:one)
    @patient = patients(:one)
  end

  test 'should not save an empty consultation' do
    consultation = Consultation.new
    assert_not consultation.valid?
    assert_not_empty consultation.errors[:diagnosis], 'no validation error for brand name present'
    assert_not_empty consultation.errors[:procedure], 'no validation error for generic name present'
  end

  test 'should not save a consultation with fields greater than 500' do
    consultation = Consultation.new(diagnosis: 'a' * 501, procedure: 'a' * 501, drug: @drug, patient: @patient,
                                    doctor: @doctor)
    assert_not consultation.valid?, 'consultation is valid with fields character greater than 50'
    assert_not_empty consultation.errors[:diagnosis], 'no validation error for diagnosis greater than 500'
    assert_not_empty consultation.errors[:procedure], 'no validation error for procedure greater than 500'
  end

  test 'valid consultation' do
    consultation = Consultation.new(diagnosis: 'MyDiagnosis', procedure: 'YourProcedure',
                                    drug: @drug, patient: @patient, doctor: @doctor)
    assert consultation.valid?
  end
end
