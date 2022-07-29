# rubocop: disable GraphQL/ExtractInputType
# frozen_string_literal: true

module Mutations
  module Drugs
    # Update drug mutation
    class UpdateDrug < Mutations::BaseMutation
      description 'Update an existing drug.'

      class NamesInput < Types::BaseInputObject
        description 'Brand and generic drug\'s names'

        argument :brand_name, String, required: false, description: 'Commercial name of the drug.'
        argument :generic_name, String, required: false, description: 'Generic name of the drug.'
      end

      argument :id, ID, required: true, description: 'ID of the drug to update'
      argument :laboratory, String, required: false, description: 'Drug\'s manufacturer'
      argument :names_input, NamesInput, required: false, description: 'Input for the drug\'s names'

      type Types::Drugs::DrugType

      def resolve(id:, laboratory: nil, names_input: nil)
        raise Exceptions::AuthenticationError, 'Not Authenticated, please login' unless context[:current_user]

        drug = Drug.find(id)
        drug.update!(
          brand_name: (names_input&.[](:brand_name).nil? ? drug.brand_name : names_input[:brand_name]),
          generic_name: (names_input&.[](:generic_name).nil? ? drug.generic_name : names_input[:generic_name]),
          laboratory: (laboratory.nil? ? drug.laboratory : laboratory)
        )
        drug
      end
    end
  end
end
# rubocop: enable GraphQL/ExtractInputType
