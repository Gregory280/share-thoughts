class CreateCategories < ActiveRecord::Migration[6.1]
  def change
    create_table :categories do |t|
      t.string :title
      t.boolean :display_in_navbar, default: false

      t.timestamps
    end
  end
end
