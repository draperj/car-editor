class Car < ApplicationRecord
    belongs_to :team

    validates :name, presence: true

    scope :ordered, -> { order(id: :desc) }

    # after_create_commit -> { broadcast_prepend_later_to "cars" }
    # after_update_commit -> { broadcast_replace_later_to "cars" }
    # after_destroy_commit -> { broadcast_remove_to "cars" }

    broadcasts_to ->(car) { [car.team, "cars"] }, inserts_by: :prepend
end