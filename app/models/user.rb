class User < ApplicationRecord
  devise :database_authenticatable, :validatable

  belongs_to :team

  def name
    email.split("@").first.capitalize
  end
end
