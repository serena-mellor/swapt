class Item < ApplicationRecord
  belongs_to :user
  belongs_to :category
  has_many :outfit_items, dependent: :destroy
  has_one_attached :photo

  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?

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
end
