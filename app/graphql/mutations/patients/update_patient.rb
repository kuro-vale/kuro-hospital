# rubocop: disable GraphQL/ExtractInputType
# frozen_string_literal: true

module Mutations
  module Patients
    # Update drug mutation
    class UpdatePatient < Mutations::BaseMutation
      description 'Update an existing patient.'

      argument :age, Int, required: false, description: 'Age of the patient.'
      argument :gender, String, required: false, description: 'Gender of the patient. (M F X)'
      argument :id, ID, required: true, description: 'ID of the drug to update'
      argument :name, String, required: false, description: 'Name of the patient.'

      type Types::Patients::PatientType

      def resolve(id:, name: nil, age: nil, gender: nil)
        raise Exceptions::AuthenticationError, 'Not Authenticated, please login' unless context[:current_user]

        patient = Patient.find(id)
        patient.update!(
          name: (name.nil? ? patient.name : name),
          age: (age.nil? ? patient.age : age),
          gender: (gender.nil? ? patient.gender : gender)
        )
        patient
      end
    end
  end
end
# rubocop: enable GraphQL/ExtractInputType
