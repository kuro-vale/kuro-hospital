# rubocop: disable GraphQL/ExtractType
# frozen_string_literal: true

module Types
  # Expose mutations types
  class MutationType < Types::BaseObject
    description 'Self descriptive.'

    field :create_consultation, mutation: Mutations::Consultations::CreateConsultation,
                                description: 'Create a new consultation.'
    field :create_drug, mutation: Mutations::Drugs::CreateDrug, description: 'Create a new drug.'
    field :create_patient, mutation: Mutations::Patients::CreatePatient, description: 'Create a new patient.'
    field :delete_consultation, mutation: Mutations::Consultations::DeleteConsultation,
                                description: 'Delete a consultation.'
    field :delete_doctor, mutation: Mutations::Doctors::DeleteDoctor, description: 'Delete your doctor profile.'
    field :delete_drug, mutation: Mutations::Drugs::DeleteDrug, description: 'Delete a drug.'
    field :delete_patient, mutation: Mutations::Patients::DeletePatient, description: 'Delete a patient.'
    field :login, mutation: Mutations::Doctors::Login, description: 'Self descriptive.'
    field :logout, mutation: Mutations::Doctors::Logout, description: 'Delete doctor session.'
    field :register, mutation: Mutations::Doctors::Register,
                     description: 'Create a new doctor, type used for authentication.'
    field :update_doctor, mutation: Mutations::Doctors::UpdateDoctor, description: 'Update your doctor profile.'
    field :update_drug, mutation: Mutations::Drugs::UpdateDrug, description: 'Update a drug.'
    field :update_patient, mutation: Mutations::Patients::UpdatePatient, description: 'Update a patient.'
  end
end
# rubocop: enable GraphQL/ExtractType
