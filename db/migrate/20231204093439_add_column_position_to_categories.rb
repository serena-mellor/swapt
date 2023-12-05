class AddColumnPositionToCategories < ActiveRecord::Migration[7.1]
  def change
    add_column :categories, :position, :string
  end
end
