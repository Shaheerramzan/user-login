# frozen_string_literal: true

# user login tokens
class Token < ApplicationRecord
  belongs_to :user
  before_create :generate_unique_token

  private

  def generate_unique_token
    self.token = loop do
      random_token = SecureRandom.urlsafe_base64(nil, false)
      break random_token unless self.class.exists?(token: random_token)
    end
  end
end
