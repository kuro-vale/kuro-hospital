# frozen_string_literal: true

require 'test_helper'

class DeleteDrugTest < ActiveSupport::TestCase
  setup do
    @doctor = doctors(:one)
    @drug = drugs(:one)
  end

  def perform(doctor:, **args)
    Mutations::Drugs::DeleteDrug.new(object: nil, field: nil, context: { current_user: doctor }).resolve(**args)
  end

  test 'should delete a drug' do
    assert_difference('Drug.count', -1) do
      perform(doctor: @doctor, id: @drug.id)
    end
  end

  test 'should not delete a drug if not logged' do
    assert_raise(Exceptions::AuthenticationError) do
      perform(doctor: nil, id: @drug.id)
    end
  end
end
