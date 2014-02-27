class LessonWord < ActiveRecord::Base
  belongs_to :word
  belongs_to :lesson
  belongs_to :answer

  validates :word_id, presence: true
end
