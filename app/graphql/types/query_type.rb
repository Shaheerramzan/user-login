# frozen_string_literal: true

module Types
  class QueryType < Types::BaseObject
    # Add `node(id: ID!) and `nodes(ids: [ID!]!)`
    include GraphQL::Types::Relay::HasNodeField
    include GraphQL::Types::Relay::HasNodesField

    # Add root-level fields here.
    # They will be entry points for queries on your schema.

    field :user_by_token, UserType, null: true do
      description 'Find a user by token'
      argument :token, String, required: true
    end
    def user_by_token(token:)
      user_token = Token.find_by_token token
      user_token.user
    end
  end
end
