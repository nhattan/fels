class CreateLessons < ActiveRecord::Migration
  def change
    create_table :lessons do |t|
      t.integer :user_id
      t.integer :score

      t.timestamps
    end
  end
end
