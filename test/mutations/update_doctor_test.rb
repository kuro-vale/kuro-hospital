# frozen_string_literal: true

require 'test_helper'

class UpdateDoctorTest < ActiveSupport::TestCase
  setup do
    @doctor = doctors(:one)
  end

  def perform(**args)
    Mutations::UpdateDoctor.new(object: nil, field: nil, context: {}).resolve(**args)
  end

  test 'should update a doctor' do
    perform(
      id: @doctor.id,
      name: 'Julian',
      university: 'Cambridge'
    )

    doctor = Doctor.find(@doctor.id)

    assert_equal doctor.name, 'Julian'
    assert_equal doctor.university, 'Cambridge'
  end

  test 'should update a doctor name' do
    perform(
      id: @doctor.id,
      name: 'Julian'
    )

    doctor = Doctor.find(@doctor.id)

    assert_equal doctor.name, 'Julian'
    assert_equal doctor.university, @doctor.university
  end

  test 'should update a doctor university' do
    perform(
      id: @doctor.id,
      university: 'Cambridge'
    )

    doctor = Doctor.find(@doctor.id)

    assert_equal doctor.name, @doctor.name
    assert_equal doctor.university, 'Cambridge'
  end
end
