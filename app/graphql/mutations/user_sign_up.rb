# frozen_string_literal: true

module Mutations
  # user signup mutation
  class UserSignUp < Mutations::BaseMutation
    argument :name, String, required: true
    argument :email, String, required: true
    argument :password, String, required: true

    # return type from the mutation
    field :token, String, null: true

    def resolve(**params)
      user_params = Hash params
      begin
        user = User.create!(user_params)
        user_token = user.tokens.create

        { token: user_token.token }
      rescue ActiveRecord::RecordInvalid => e
        GraphQL::ExecutionError.new("Invalid attributes for #{e.record.class}:"\
          " #{e.record.errors.full_messages.join(', ')}")
      end
    end
  end
end
