# frozen_string_literal: true

require 'test_helper'

class DeleteDoctorTest < ActiveSupport::TestCase
  setup do
    @doctor = doctors(:one)
  end

  def perform(**args)
    Mutations::DeleteDoctor.new(object: nil, field: nil, context: {}).resolve(**args)
  end

  test 'should delete a doctor' do
    assert_difference('Doctor.count', -1) do
      perform(id: @doctor.id)
    end
  end
end
