# frozen_string_literal: true

module Mutations
  # Edit doctor mutation
  class DeleteDoctor < BaseMutation
    description 'Update your doctor profile.'

    # TODO: remove, change find by id with find by current session
    argument :id, ID, required: true, description: 'Find the doctor to update'

    field :message, String, description: 'message of success'

    def resolve(id:)
      doctor = Doctor.find(id)
      { message: "#{doctor.name} was deleted" } if doctor.destroy
    end
  end
end
