class Article < ApplicationRecord
  validates :title, presence: true
  validates :author_id, presence: true
  validates :text, presence: true
  validates :image, presence: true
  
  belongs_to :user
  has_many :votes
  belongs_to :category
end
