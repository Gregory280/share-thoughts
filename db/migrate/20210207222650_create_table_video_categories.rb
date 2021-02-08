class CreateTableVideoCategories < ActiveRecord::Migration[6.1]
  def change
    create_table :video_categories do |t|
      t.integer :video_id
      t.integer :category_id
    end
  end
end
