# frozen_string_literal: true

module Types
  module Drugs
    class DrugType < Types::BaseObject
      description 'Drug type.'

      field :brand_name, String, null: false, description: 'Commercial name of the drugs.'
      field :consultations, [Consultations::ConsultationType],
            description: 'Consultations where this drug was prescribed.'
      field :generic_name, String, null: false, description: 'Generic name of the drugs.'
      field :id, ID, null: false, description: 'ID of the drug.'
      field :laboratory, String, null: false, description: 'Drug\'s manufacturer.'
    end
  end
end
