class ChangeColumnPositionInCategories < ActiveRecord::Migration[7.1]
  def change
    change_column :categories, :position, :integer, using: 'position::integer'
  end
end
