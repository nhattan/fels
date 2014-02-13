class Word < ActiveRecord::Base
  belongs_to :category

  validates :content, presence: true, length: { maximum: 20 },
    uniqueness: { case_sensitive: false }
  validates :meaning, presence: true, length: { maximum: 50 }
end
