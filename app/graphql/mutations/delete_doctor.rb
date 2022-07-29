# frozen_string_literal: true

module Mutations
  # Edit doctor mutation
  class DeleteDoctor < BaseMutation
    description 'Delete logger doctor.'

    field :message, String, description: 'message of success'

    def resolve
      raise Exceptions::AuthenticationError, 'Not Authenticated, please login' unless context[:current_user]

      doctor = context[:current_user]
      { message: "#{doctor.name} was deleted" } if doctor.destroy
    end
  end
end
