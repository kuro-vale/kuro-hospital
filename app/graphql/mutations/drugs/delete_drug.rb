# frozen_string_literal: true

module Mutations
  module Drugs
    # Edit doctor mutation
    class DeleteDrug < Mutations::BaseMutation
      description 'Delete drug.'

      argument :id, ID, required: true, description: 'ID of the drug to delete'

      field :message, String, description: 'message of success'

      def resolve(id:)
        raise Exceptions::AuthenticationError, 'Not Authenticated, please login' unless context[:current_user]

        drug = Drug.find(id)
        { message: "#{drug.brand_name} was deleted" } if drug.destroy
      end
    end
  end
end
