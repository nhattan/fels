class AddAnswerIdToLessonWords < ActiveRecord::Migration
  def change
  	add_column :lesson_words, :answer_id, :integer
  end
end
