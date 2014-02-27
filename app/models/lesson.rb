class Lesson < ActiveRecord::Base
  belongs_to :category
  belongs_to :user
  
  has_many :lesson_words, dependent: :destroy

  validates :category_id, presence: true

  before_save :sum_score

  accepts_nested_attributes_for :lesson_words

  private
  
    def sum_score
      self.score = 0
      self.lesson_words.each do |word|
        if !word.answer.nil? && word.answer.correct?
          self.score += 1
        end
      end
    end
end
