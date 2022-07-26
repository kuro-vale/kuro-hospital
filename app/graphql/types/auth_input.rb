# frozen_string_literal: true

module Types
  class AuthInput < Types::BaseInputObject
    description 'Doctor type, used for authentication.'

    argument :password, String, required: true, description: 'Secure password.'
    argument :username, String, required: true, description: 'Unique username.'
  end
end
