class Article < ApplicationRecord
  belongs_to :user
  has_many :votes
  belongs_to :category
end
