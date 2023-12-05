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

end
