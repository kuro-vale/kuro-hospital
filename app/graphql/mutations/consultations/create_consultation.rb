# rubocop: disable GraphQL/ExtractInputType
# frozen_string_literal: true

module Mutations
  module Consultations
    # Create consultation mutation
    class CreateConsultation < Mutations::BaseMutation
      description 'Create a new consultation.'

      class IdsInput < Types::BaseInputObject
        description 'Input to filter ids required to create diagnosis'

        argument :drug_id, ID, required: true, description: 'Id of the drug prescribed.'
        argument :patient_id, ID, required: true, description: 'Id of the consultation\'s patient'
      end

      argument :diagnosis, String, required: true, description: 'Diagnosis of the patient.'
      argument :ids_input, IdsInput, required: true, description: 'Ids of the doctor, patient, and drug'
      argument :procedure, String, required: true, description: 'Procedure made to the patient.'

      type Types::Consultations::ConsultationType

      def resolve(diagnosis:, procedure:, ids_input:)
        raise Exceptions::AuthenticationError, 'Not Authenticated, please login' unless context[:current_user]

        drug = Drug.find(ids_input[:drug_id])
        patient = Patient.find(ids_input[:patient_id])

        Consultation.create!(
          diagnosis:,
          procedure:,
          doctor: context[:current_user],
          drug:,
          patient:
        )
      end
    end
  end
end
# rubocop: enable GraphQL/ExtractInputType
