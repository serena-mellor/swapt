class RemoveColumnFromItems < ActiveRecord::Migration[7.1]
  def change
    remove_column :items, :type
  end
end
