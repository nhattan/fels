class CreateWords < ActiveRecord::Migration
  def change
    create_table :words do |t|
      t.string :content
      t.integer :category_id

      t.timestamps
    end
    add_index :words, :category_id
  end
end
