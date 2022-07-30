# rubocop: disable GraphQL/ExtractType
# frozen_string_literal: true

module Types
  # Expose mutations types
  class MutationType < Types::BaseObject
    description 'Self descriptive.'

    field :create_consultation, mutation: Mutations::Consultation::CreateConsultation,
                                description: 'Create a new consultation.'
    field :create_drug, mutation: Mutations::Drugs::CreateDrug, description: 'Create a new drug.'
    field :delete_consultation, mutation: Mutations::Consultation::DeleteConsultation,
                                description: 'Delete a consultation.'
    field :delete_doctor, mutation: Mutations::Doctors::DeleteDoctor, description: 'Delete your doctor profile.'
    field :delete_drug, mutation: Mutations::Drugs::DeleteDrug, description: 'Delete a drug.'
    field :login, mutation: Mutations::Doctors::Login, description: 'Self descriptive.'
    field :register, mutation: Mutations::Doctors::Register,
                     description: 'Create a new doctor, type used for authentication.'
    field :update_doctor, mutation: Mutations::Doctors::UpdateDoctor, description: 'Update your doctor profile.'
    field :update_drug, mutation: Mutations::Drugs::UpdateDrug, description: 'Update a drug.'
  end
end
# rubocop: enable GraphQL/ExtractType
