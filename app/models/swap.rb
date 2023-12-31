class Swap < ApplicationRecord
  belongs_to :sender, class_name: :User
  belongs_to :receiver, class_name: :User
  belongs_to :requested_item, class_name: :Item
  belongs_to :second_item, class_name: :Item, optional: true
  has_one :chatroom

  enum :status, ["pending", "denied", "accepted"]
end
