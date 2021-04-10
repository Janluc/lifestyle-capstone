class User < ApplicationRecord
  has_many :votes
  has_many :articles
end
