class Category < ApplicationRecord
  has_many :items
  enum :position, [:hat, :top, :middle, :dress, :accessories, :bottom]
end
