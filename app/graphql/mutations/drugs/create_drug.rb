# frozen_string_literal: true

module Mutations
  module Drugs
    # Create drug mutation
    class CreateDrug < Mutations::BaseMutation
      description 'Create a new drug to medicate patients.'

      class NamesInput < Types::BaseInputObject
        description 'Brand and generic drug\'s names'

        argument :brand_name, String, required: true, description: 'Commercial name of the drug.'
        argument :generic_name, String, required: true, description: 'Generic name of the drug.'
      end

      argument :laboratory, String, required: true, description: 'Drug\'s manufacturer'
      argument :names_input, NamesInput, required: true, description: 'Input for the drug\'s names'

      type Types::Drugs::DrugType

      def resolve(laboratory:, names_input:)
        raise Exceptions::AuthenticationError, 'Not Authenticated, please login' unless context[:current_user]

        Drug.create!(
          brand_name: names_input[:brand_name],
          generic_name: names_input[:generic_name],
          laboratory:
        )
      end
    end
  end
end
