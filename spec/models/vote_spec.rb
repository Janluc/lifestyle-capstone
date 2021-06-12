require 'rails_helper'

RSpec.describe Vote, type: :model do
  context 'vote ownership' do
    it 'checks if vote belongs to a article' do
      vote = Vote.new
      expect(vote.article_id.nil?).to eq(true)

      vote2 = Vote.new({ article_id: 1 })
      expect(vote2.article_id.nil?).to eq(false)
    end

    it 'checks if vote belongs to a user' do
      vote = Vote.new
      expect(vote.user_id.nil?).to eq(true)

      vote2 = Vote.new({ user_id: 1 })
      expect(vote2.user_id.nil?).to eq(false)
    end
  end
end
