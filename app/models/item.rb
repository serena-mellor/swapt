class Item < ApplicationRecord
  belongs_to :user
  belongs_to :category
  has_many :outfit_items, dependent: :destroy
  has_one_attached :photo
  TYPES = ["top", "bottom", "shoes", "dress", "hat", "accessories"]

  validates :title, :photo, :category, presence: true


  include PgSearch::Model
  pg_search_scope :search_by_title_and_description,
    against: [ :title, :description ],
    associated_against: {
      category: [:title]
    },
    using: {
      tsearch: { prefix: true }
  }

  def full_location
    "#{country} #{postcode}"
  end
  # geocoded_by :item_location
  # after_validation :geocode, if: ->(obj) { obj.item_location.present? && obj.item_location_changed? }

  # geocoded_by :full_location
  # after_validation :geocode, if: ->(obj) { obj.full_location.present? && obj.full_location_changed? }

  # def full_location
  #   "#{city}, #{country} #{postcode}"
  # end
end
end
