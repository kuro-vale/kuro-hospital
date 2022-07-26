# frozen_string_literal: true

module Mutations
  # Edit doctor mutation
  class UpdateDoctor < BaseMutation
    description 'Update your doctor profile.'

    # TODO: remove, change find by id with find by current session
    argument :id, ID, required: true, description: 'Find the doctor to update'
    argument :name, String, required: false, description: 'Update your name'
    argument :university, String, required: false, description: 'Update the university where you attended'

    type Types::DoctorType

    def resolve(id:, name: nil, university: nil)
      doctor = Doctor.find(id)
      name = doctor.name if name.nil?
      university = doctor.university if university.nil?
      doctor.update!(
        name:,
        university:
      )
      doctor
    end
  end
end
