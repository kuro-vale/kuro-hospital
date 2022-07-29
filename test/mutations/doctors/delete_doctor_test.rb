# frozen_string_literal: true

require 'test_helper'

class DeleteDoctorTest < ActiveSupport::TestCase
  setup do
    @doctor = doctors(:one)
  end

  def perform(doctor:)
    Mutations::Doctors::DeleteDoctor.new(object: nil, field: nil, context: { current_user: doctor }).resolve
  end

  test 'should delete a doctor' do
    assert_difference('Doctor.count', -1) do
      perform(doctor: @doctor)
    end
  end

  test 'should not delete a doctor if not logged' do
    assert_raise(Exceptions::AuthenticationError) do
      perform(doctor: nil)
    end
  end
end
