class AddClassificationToCategories < ActiveRecord::Migration[6.1]
  def change
    add_column :categories, :classification, :integer
  end
end
