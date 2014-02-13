class Word < ActiveRecord::Base
  has_many :answers, dependent: :destroy
  belongs_to :category

  validates :content, presence: true, length: { maximum: 20 },
    uniqueness: { case_sensitive: false }
  validates :meaning, presence: true, length: { maximum: 50 }
  validates :category_id, presence: true
  accepts_nested_attributes_for :answers, allow_destroy: true
end
