# frozen_string_literal: true

require 'test_helper'

class RegisterTest < ActiveSupport::TestCase
  def perform(**args)
    Mutations::Register.new(object: nil, field: nil, context: {}).resolve(**args)
  end

  test 'should create a new doctor' do
    payload = perform(
      name: 'Julian',
      university: 'Cambridge'
    )

    assert payload.persisted?
    assert_equal payload.name, 'Julian'
    assert_equal payload.university, 'Cambridge'
  end
end
