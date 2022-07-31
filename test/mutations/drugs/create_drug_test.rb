# frozen_string_literal: true

require 'test_helper'

class CreateDrugTest < ActiveSupport::TestCase
  setup do
    @doctor = doctors(:one)
  end

  def perform(doctor:, **args)
    Mutations::Drugs::CreateDrug.new(object: nil, field: nil, context: { current_user: doctor }).resolve(**args)
  end

  test 'should create a new drug' do
    payload = perform(
      doctor: @doctor,
      brand_name: 'Ace',
      generic_name: 'Acetaminophen',
      laboratory: 'RubyLab'
    )

    assert payload.persisted?
    assert_equal payload.brand_name, 'Ace'
    assert_equal payload.generic_name, 'Acetaminophen'
    assert_equal payload.laboratory, 'RubyLab'
  end

  test 'should not create a new drug if not logged' do
    assert_raise(Exceptions::AuthenticationError) do
      perform(
        doctor: nil,
        brand_name: 'Ace',
        generic_name: 'Acetaminophen',
        laboratory: 'RubyLab'
      )
    end
  end
end
