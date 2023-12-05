class Chatroom < ApplicationRecord
  belongs_to :swap
  has_many :messages
  has_many :users, through: :swap, source: :receiver
  has_many :other_users, through: :swap, source: :sender
end
