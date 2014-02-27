class Category < ActiveRecord::Base
  has_many :words, dependent: :destroy
  has_many :lesson

  validates :name, presence: true, length: { maximum: 30 }
  validates :name, uniqueness: { case_sensitive: false }
  validates :des, presence:true, length: { maximum: 255 }
end
