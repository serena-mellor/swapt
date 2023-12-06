class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :items, dependent: :destroy
  has_many :followers, class_name: "Follow", foreign_key: :follower_id
  has_many :followees, class_name: "Follow", foreign_key: :followee_id
  has_many :outfits
  has_many :favourites
  has_many :favourited_outfits, through: :favourites, source: :outfit

  geocoded_by :address
  after_validation :geocode, if: ->(obj) { obj.address.present? && obj.address_changed? }
end
