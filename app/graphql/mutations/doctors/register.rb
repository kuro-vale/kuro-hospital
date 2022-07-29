# frozen_string_literal: true

module Mutations
  module Doctors
    # Register resolver
    class Register < Mutations::BaseMutation
      include AuthHelper
      description 'Create a new doctor, type used for authentication.'

      class ProfileInput < Types::BaseInputObject
        description 'Input to manage doctor profile'

        argument :name, String, required: true, description: 'Your name'
        argument :university, String, required: true, description: 'University where you attended'
      end

      argument :auth_input, Types::Doctors::AuthInput, required: true, description: 'Required data for authentication'
      argument :profile_input, ProfileInput, required: true, description: 'Data for creating doctor profile'

      field :doctor, Types::Doctors::DoctorType, null: false, description: 'Registered doctor'
      field :token, String, null: false, description: 'Token to handle sessions'

      def resolve(profile_input:, auth_input:)
        doctor = Doctor.create!(
          name: profile_input[:name],
          university: profile_input[:university],
          username: auth_input[:username],
          password: auth_input[:password]
        )
        token = generate_token(doctor.id)
        context[:session][:token] = token

        { doctor:, token: }
      end
    end
  end
end
