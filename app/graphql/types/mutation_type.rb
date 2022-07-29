# frozen_string_literal: true

module Types
  # Expose mutations types
  class MutationType < Types::BaseObject
    description 'Self descriptive.'

    field :delete_doctor, mutation: Mutations::Doctors::DeleteDoctor, description: 'Delete your doctor profile.'
    field :login, mutation: Mutations::Doctors::Login, description: 'Self descriptive.'
    field :register, mutation: Mutations::Doctors::Register,
                     description: 'Create a new doctor, type used for authentication.'
    field :update_doctor, mutation: Mutations::Doctors::UpdateDoctor, description: 'Update your doctor profile.'
  end
end
