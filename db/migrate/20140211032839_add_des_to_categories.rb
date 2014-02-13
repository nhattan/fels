class AddDesToCategories < ActiveRecord::Migration
  def change
    add_column :categories, :des, :string
  end
end
