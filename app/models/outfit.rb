class Outfit < ApplicationRecord
  belongs_to :user
  has_many :outfit_items, dependent: :destroy
  has_many :items, through: :outfit_items

  # def sort_items_by_position
  #   items.sort_by { |item| item.category.position }
  # end

  def sort_items_by_position
    items.includes?(:category).sort_by { |item| Category.positions[item.category.position] }
  end
end
