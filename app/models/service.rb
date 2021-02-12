class Service < ApplicationRecord
  # Associations
  # ======================================================
  belongs_to :vehicle
  has_one_attached :receipt_image, dependent: :destroy

  # Validations
  # ======================================================
  validates :receipt_image, content_type: [:png, :jpg, :jpeg]
end
