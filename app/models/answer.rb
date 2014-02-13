class Answer < ActiveRecord::Base
  belongs_to :word
  validate :content, presence: true, length: { maximum: 20 }

  def correct?()
    self.correct == 1
  end
end
