class Vehicle < ApplicationRecord
  # Validations
  # ======================================================
  validates :year, :make, :model, presence: true

  # Associations
  # ======================================================
  belongs_to :user
end
