# frozen_string_literal: true

module Mutations
  module Consultations
    # Delete consultation mutation
    class DeleteConsultation < Mutations::BaseMutation
      description 'Delete consultation.'

      argument :id, ID, required: true, description: 'ID of the consultation to delete'

      field :message, String, description: 'message of success'

      def resolve(id:)
        raise Exceptions::AuthenticationError, 'Not Authenticated, please login' unless context[:current_user]

        consultation = Consultation.find(id)
        raise Exceptions::AuthorizationError, 'Unauthorized' if context[:current_user].id != consultation.doctor.id

        { message: "Consultation for #{consultation.patient.name} was deleted" } if consultation.destroy
      end
    end
  end
end
