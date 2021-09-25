require './lib/modules/api_key'

class User < ApplicationRecord
  extend ApiKey

  validates :password, confirmation: true
  validates :email, uniqueness: true, presence: true, allow_empty: false
  validates :password, presence: { require: true, allow_empty: false }
  validates :password_confirmation, presence: { require: true, allow_empty: false }

  has_secure_password

  def self.set_api_key
    ApiKey.generator
  end
end
