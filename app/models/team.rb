class Team < ApplicationRecord
    has_many :users, dependent: :destroy
    has_many :cars, dependent: :destroy

    validates :name, presence: true
end
