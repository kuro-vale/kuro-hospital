# frozen_string_literal: true

require 'test_helper'

class RegisterTest < ActiveSupport::TestCase
  def perform(**args)
    Mutations::Register.new(object: nil, field: nil, context: { session: {} }).resolve(**args)
  end

  test 'should create a new doctor' do
    payload = perform(
      profile_input: {
        name: 'Julian',
        university: 'Cambridge'
      },
      auth_input: {
        username: 'kuro',
        password: '123'
      }
    )

    assert payload[:doctor].persisted?
    assert_equal payload[:doctor].name, 'Julian'
    assert_equal payload[:doctor].university, 'Cambridge'
    assert_equal payload[:doctor].username, 'kuro'
    assert_equal payload[:doctor].password, '123'
  end
end
