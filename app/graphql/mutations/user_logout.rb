# frozen_string_literal: true

module Mutations
  # user signup mutation
  class UserLogout < Mutations::BaseMutation
    argument :token, String, required: true

    # return type from the mutation
    field :status, Boolean, null: true

    def authorized?(**inputs)
      @token = Token.find_by_token(inputs[:token])
      @token.present?
    end

    def resolve(**params)
      return unless authorized? params

      @token.destroy!
      { status: @token.destroyed? }
    end
  end
end
