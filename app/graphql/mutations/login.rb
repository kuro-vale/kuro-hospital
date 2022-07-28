# frozen_string_literal: true

module Mutations
  # Mutation to handle logins
  class Login < BaseMutation
    description 'Provide credentials to generate a session'

    argument :credentials, Types::AuthInput, required: true, description: 'Credential required for authentication'

    field :doctor, Types::DoctorType, null: false, description: 'Logged doctor'
    field :token, String, null: false, description: 'Token to handle sessions'

    def resolve(credentials:)
      doctor = Doctor.find_by(username: credentials[:username])

      return GraphQL::ExecutionError.new('Invalid credentials') unless doctor
      return GraphQL::ExecutionError.new('Invalid credentials') unless doctor.authenticate(credentials[:password])

      token = generate_token(doctor.id)
      context[:session][:token] = token

      { doctor:, token: }
    end

    private

    def generate_token(doctor_id)
      payload = {
        sub: doctor_id,
        iat: Time.current.to_i
      }
      JWT.encode(payload, ENV.fetch('HMAC_SECRET'), 'HS256')
    end
  end
end
