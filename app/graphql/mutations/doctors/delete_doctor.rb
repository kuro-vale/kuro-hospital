# frozen_string_literal: true

module Mutations
  module Doctors
    # Edit doctor mutation
    class DeleteDoctor < Mutations::BaseMutation
      description 'Delete logged doctor.'

      field :message, String, description: 'message of success'

      def resolve
        raise Exceptions::AuthenticationError, 'Not Authenticated, please login' unless context[:current_user]

        doctor = context[:current_user]
        context[:session][:token] = nil
        { message: "#{doctor.name} was deleted" } if doctor.destroy
      end
    end
  end
end
