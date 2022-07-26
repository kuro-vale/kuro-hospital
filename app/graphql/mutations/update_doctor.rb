# frozen_string_literal: true

module Mutations
  # Edit doctor mutation
  class UpdateDoctor < BaseMutation
    description 'Update your doctor profile.'

    class UpdateProfileInput < Types::BaseInputObject
      description 'Input to manage doctor profile'

      argument :name, String, required: false, description: 'Update your name'
      argument :university, String, required: false, description: 'Update the university where you attended'
    end

    # TODO: remove, change find by id with find by current session
    argument :id, ID, required: true, description: 'Find the doctor to update'

    argument :update_profile_input, UpdateProfileInput, required: false, description: 'Data for updating doctor profile'
    argument :username, String, required: false, description: 'Update your username'

    type Types::DoctorType

    def resolve(id:, update_profile_input: nil, username: nil)
      doctor = Doctor.find(id)
      doctor.update!(
        name: (update_profile_input&.[](:name).nil? ? doctor.name : update_profile_input&.[](:name)),
        university:
        (update_profile_input&.[](:university).nil? ? doctor.university : update_profile_input&.[](:university)),
        username: (username.nil? ? doctor.username : username)
      )
      doctor
    end
  end
end
