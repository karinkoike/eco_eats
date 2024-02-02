class Meal < ApplicationRecord
  belongs_to :user
  has_one_attached :image

  validates :name, presence: true
  validates :description, presence: true, length: { maximum: 500 }
  validates :meal_time, presence: true
  validate :image_presence

  private

  def image_presence
    errors.add(:image, "を添付してください。") unless image.attached?
  end

  def calculate_co2_reduction
  end
end
