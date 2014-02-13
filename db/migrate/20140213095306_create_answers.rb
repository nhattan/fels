class CreateAnswers < ActiveRecord::Migration
  def change
    create_table :answers do |t|
      t.string :content
      t.integer :word_id
      t.integer :correct

      t.timestamps
    end

    change_column_default :answers, :correct, 0
  end
end
