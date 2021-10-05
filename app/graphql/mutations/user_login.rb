# frozen_string_literal: true

module Mutations
  # user signup mutation
  class UserLogin < Mutations::BaseMutation
    argument :email, String, required: true
    argument :password, String, required: true

    # return type from the mutation
    field :token, String, null: true

    def authorized?(**inputs)
      @user = User.find_by_email(inputs[:email])
      @user.present?
    end

    def resolve(**params)
      return unless authorized? params

      user_token = @user.tokens.create
      { token: user_token.token }
    end
  end
end
