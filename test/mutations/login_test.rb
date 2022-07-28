# frozen_string_literal: true

require 'test_helper'

class LoginTest < ActiveSupport::TestCase
  setup do
    @doctor = doctors(:one)
    ENV['HMAC_SECRET'] = 'secret'
  end

  def perform(**args)
    Mutations::Login.new(object: nil, field: nil, context: { session: {} }).resolve(**args)
  end

  test 'should login a doctor' do
    payload = perform(
      credentials: {
        username: @doctor.username,
        password: '123'
      }
    )

    assert_equal payload[:doctor], @doctor
    assert_nothing_raised do
      JWT.decode(payload[:token], ENV.fetch('HMAC_SECRET'), true, { algorithm: 'HS256' })
    end
  end
end
