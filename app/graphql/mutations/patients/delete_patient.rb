# frozen_string_literal: true

module Mutations
  module Patients
    # Delete doctor mutation
    class DeletePatient < Mutations::BaseMutation
      description 'Delete patient.'

      argument :id, ID, required: true, description: 'ID of the patient to delete'

      field :message, String, description: 'message of success'

      def resolve(id:)
        raise Exceptions::AuthenticationError, 'Not Authenticated, please login' unless context[:current_user]

        patient = Patient.find(id)
        { message: "#{patient.name} was deleted" } if patient.destroy
      end
    end
  end
end
