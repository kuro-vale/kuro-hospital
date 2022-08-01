# frozen_string_literal: true

module Mutations
  module Doctors
    # Delete session mutation
    class Logout < Mutations::BaseMutation
      description 'Delete session.'

      field :message, String, description: 'message of success'

      def resolve
        raise Exceptions::AuthenticationError, 'Not Authenticated, please login' unless context[:current_user]

        context[:session][:token] = nil
        { message: 'Successfully logout' }
      end
    end
  end
end
