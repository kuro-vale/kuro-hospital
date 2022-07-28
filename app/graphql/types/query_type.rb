# frozen_string_literal: true

module Types
  # Expose query types
  class QueryType < Types::BaseObject
    description 'Self descriptive.'
    # Add `node(id: ID!) and `nodes(ids: [ID!]!)`
    include GraphQL::Types::Relay::HasNodeField
    include GraphQL::Types::Relay::HasNodesField

    # Add root-level fields here.
    # They will be entry points for queries on your schema.

    field :current_doctor, DoctorType, null: false, description: 'Get logged doctor'
    field :doctors, [DoctorType], null: false,
                                  description: 'Query to find all doctors'

    def doctors
      Doctor.all
    end

    def current_doctor
      context[:current_user]
    end
  end
end
