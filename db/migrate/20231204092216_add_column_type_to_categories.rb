class AddColumnTypeToCategories < ActiveRecord::Migration[7.1]
  def change
    add_column :categories, :type, :string
  end
end
