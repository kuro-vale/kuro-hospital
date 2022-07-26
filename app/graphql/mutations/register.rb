# frozen_string_literal: true

module Mutations
  # Register resolver
  class Register < BaseMutation
    description 'Create a new doctor, type used for authentication.'

    argument :name, String, required: true, description: 'Required, your name'
    argument :university, String, required: true, description: 'Required, university where you attended'

    # return type from the mutation
    type Types::DoctorType

    def resolve(name: nil, university: nil)
      Doctor.create!(
        name:,
        university:
      )
    end
  end
end
