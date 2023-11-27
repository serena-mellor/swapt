class CreateSwaps < ActiveRecord::Migration[7.1]
  def change
    create_table :swaps do |t|
      t.integer :sender_id
      t.integer :receiver_id
      t.integer :requested_item_id
      t.integer :second_item_id
      t.integer :status, default: 0
      t.timestamps
    end
  end
end
