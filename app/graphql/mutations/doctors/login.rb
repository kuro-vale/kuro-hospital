# frozen_string_literal: true

module Mutations
  module Doctors
    # Mutation to handle logins
    class Login < Mutations::BaseMutation
      include AuthHelper
      description 'Provide credentials to generate a session'

      argument :credentials, Types::Doctors::AuthInput, required: true,
                                                        description: 'Credential required for authentication'

      field :doctor, Types::Doctors::DoctorType, null: false, description: 'Logged doctor'
      field :token, String, null: false, description: 'Token to handle sessions'

      def resolve(credentials:)
        doctor = Doctor.find_by(username: credentials[:username])

        raise Exceptions::InvalidUsername, 'Invalid credentials' unless doctor
        raise Exceptions::AuthenticationError, 'Invalid credentials' unless doctor.authenticate(credentials[:password])

        token = generate_token(doctor.id)
        context[:session][:token] = token

        { doctor:, token: }
      end
    end
  end
end
