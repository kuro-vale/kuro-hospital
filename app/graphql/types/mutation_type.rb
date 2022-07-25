# frozen_string_literal: true

module Types
  # Expose mutations types
  class MutationType < Types::BaseObject
    description 'Self descriptive.'

    field :register, mutation: Mutations::Register, description: 'Create a new doctor, type used for authentication.'
    field :update_doctor, mutation: Mutations::UpdateDoctor, description: 'Update your doctor profile.'
  end
end
