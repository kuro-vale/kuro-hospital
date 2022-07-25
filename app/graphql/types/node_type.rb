# frozen_string_literal: true

module Types
  module NodeType
    description 'Self descriptive.'
    include Types::BaseInterface
    # Add the `id` field
    include GraphQL::Types::Relay::NodeBehaviors
  end
end
