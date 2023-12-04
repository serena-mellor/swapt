class Item < ApplicationRecord
  belongs_to :user
  belongs_to :category
  has_many :outfit_items, dependent: :destroy
  has_one_attached :photo
  TYPES = ["top", "bottom", "shoes", "dress", "hat", "accessories"]

  validates :title, :photo, :category, presence: true
end
