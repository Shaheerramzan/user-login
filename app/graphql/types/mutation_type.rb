# frozen_string_literal: true

module Types
  class MutationType < Types::BaseObject
    field :user_sign_up, mutation: Mutations::UserSignUp
    field :user_login, mutation: Mutations::UserLogin
  end
end
