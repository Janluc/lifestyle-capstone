class Article < ApplicationRecord
  validates :title, presence: true, length: {minimum: 4}
  validates :text, presence: true, length: {minimum: 10}
  validates :image, presence: true

  belongs_to :user
  has_many :votes
  belongs_to :category
end
