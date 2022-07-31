# rubocop: disable GraphQL/ExtractInputType
# frozen_string_literal: true

module Mutations
  module Drugs
    # Create drug mutation
    class CreateDrug < Mutations::BaseMutation
      description 'Create a new drug to medicate patients.'

      argument :brand_name, String, required: true, description: 'Commercial name of the drug.'
      argument :generic_name, String, required: true, description: 'Generic name of the drug.'
      argument :laboratory, String, required: true, description: 'Drug\'s manufacturer'

      type Types::Drugs::DrugType

      def resolve(laboratory:, brand_name:, generic_name:)
        raise Exceptions::AuthenticationError, 'Not Authenticated, please login' unless context[:current_user]

        Drug.create!(
          brand_name:,
          generic_name:,
          laboratory:
        )
      end
    end
  end
end
# rubocop: enable GraphQL/ExtractInputType
