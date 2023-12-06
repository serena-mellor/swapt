class Outfit < ApplicationRecord
  belongs_to :user
  has_many :outfit_items, dependent: :destroy
  has_many :items, through: :outfit_items
  has_many :favourites

  def sort_items_by_position
    items.sort_by { |item| item.category.position }.reverse
  end
end
