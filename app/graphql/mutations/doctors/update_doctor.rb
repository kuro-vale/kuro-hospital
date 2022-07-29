# frozen_string_literal: true

module Mutations
  module Doctors
    # Edit doctor mutation
    class UpdateDoctor < Mutations::BaseMutation
      description 'Update your doctor profile.'

      class UpdateProfileInput < Types::BaseInputObject
        description 'Input to manage doctor profile'

        argument :name, String, required: false, description: 'Update your name'
        argument :university, String, required: false, description: 'Update the university where you attended'
      end

      argument :update_profile_input, UpdateProfileInput, required: false,
                                                          description: 'Data for updating doctor profile'
      argument :username, String, required: false, description: 'Update your username'

      type Types::Doctors::DoctorType

      def resolve(update_profile_input: nil, username: nil)
        raise Exceptions::AuthenticationError, 'Not Authenticated, please login' unless context[:current_user]

        doctor = context[:current_user]
        doctor.update!(
          name: (update_profile_input&.[](:name).nil? ? doctor.name : update_profile_input[:name]),
          university:
          (update_profile_input&.[](:university).nil? ? doctor.university : update_profile_input[:university]),
          username: (username.nil? ? doctor.username : username)
        )
        doctor
      end
    end
  end
end
