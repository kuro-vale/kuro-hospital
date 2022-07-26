# frozen_string_literal: true

module Mutations
  # Register resolver
  class Register < BaseMutation
    description 'Create a new doctor, type used for authentication.'

    class ProfileInput < Types::BaseInputObject
      description 'Input to manage doctor profile'

      argument :name, String, required: true, description: 'Your name'
      argument :university, String, required: true, description: 'University where you attended'
    end

    argument :auth_input, Types::AuthInput, required: true, description: 'Required data for authentication'
    argument :profile_input, ProfileInput, required: true, description: 'Data for creating doctor profile'

    # return type from the mutation
    type Types::DoctorType

    def resolve(profile_input:, auth_input:)
      Doctor.create!(
        name: profile_input[:name],
        university: profile_input[:university],
        username: auth_input[:username],
        password: auth_input[:password]
      )
    end
  end
end
