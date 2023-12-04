class Chatroom < ApplicationRecord
  belongs_to :swap
  has_many :messages

end
