# rubocop: disable GraphQL/ExtractInputType
# frozen_string_literal: true

module Mutations
  module Patients
    # Create patient mutation
    class CreatePatient < Mutations::BaseMutation
      description 'Create a new patient.'

      argument :age, Int, required: true, description: 'Age of the patient.'
      argument :gender, String, required: true, description: 'Gender of the patient. (M F X)'
      argument :name, String, required: true, description: 'Name of the patient.'

      type Types::Patients::PatientType

      def resolve(name:, age:, gender:)
        raise Exceptions::AuthenticationError, 'Not Authenticated, please login' unless context[:current_user]

        Patient.create!(
          name:,
          age:,
          gender:
        )
      end
    end
  end
end
# rubocop: enable GraphQL/ExtractInputType
