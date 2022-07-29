# frozen_string_literal: true

# Helpers method for Authentication
module AuthHelper
  def generate_token(doctor_id)
    payload = {
      sub: doctor_id,
      iat: Time.current.to_i
    }
    JWT.encode(payload, ENV.fetch('HMAC_SECRET'), 'HS256')
  end
end
