# frozen_string_literal: true

require 'test_helper'

class UpdateDrugTest < ActiveSupport::TestCase
  setup do
    @doctor = doctors(:one)
    @drug = drugs(:one)
  end

  def perform(doctor:, **args)
    Mutations::Drugs::UpdateDrug.new(object: nil, field: nil, context: { current_user: doctor }).resolve(**args)
  end

  test 'should update a drug' do
    perform(
      doctor: @doctor,
      id: @drug.id,
      names_input: {
        brand_name: 'Ci',
        generic_name: 'Cpp'
      },
      laboratory: 'CLab'
    )

    drug = Drug.find(@drug.id)

    assert_equal drug.brand_name, 'Ci'
    assert_equal drug.generic_name, 'Cpp'
    assert_equal drug.laboratory, 'CLab'
  end

  test 'should update a drug brand name' do
    perform(
      doctor: @doctor,
      id: @drug.id,
      names_input: {
        brand_name: 'Ci'
      }
    )

    drug = Drug.find(@drug.id)

    assert_equal drug.brand_name, 'Ci'
    assert_equal drug.generic_name, @drug.generic_name
    assert_equal drug.laboratory, @drug.laboratory
  end

  test 'should update a drug generic_name' do
    perform(
      doctor: @doctor,
      id: @drug.id,
      names_input: {
        generic_name: 'Cpp'
      }
    )

    drug = Drug.find(@drug.id)

    assert_equal drug.brand_name, @drug.brand_name
    assert_equal drug.generic_name, 'Cpp'
    assert_equal drug.laboratory, @drug.laboratory
  end

  test 'should update a drug laboratory' do
    perform(
      doctor: @doctor,
      id: @drug.id,
      laboratory: 'CLab'
    )

    drug = Drug.find(@drug.id)

    assert_equal drug.brand_name, @drug.brand_name
    assert_equal drug.generic_name, @drug.generic_name
    assert_equal drug.laboratory, 'CLab'
  end

  test 'should not update a drug if not logged' do
    assert_raise(Exceptions::AuthenticationError) do
      perform(
        doctor: nil,
        id: @drug.id,
        names_input: {
          brand_name: 'Ci',
          generic_name: 'Cpp'
        },
        laboratory: 'CLab'
      )
    end
  end
end
