require 'rails_helper'

RSpec.describe User, type: :model do
  context 'User Article creation' do
    it 'New user should have no article' do
      user = User.new
      expect(user.articles.empty?).to eq(true)
    end

    it 'checks if user has created an article' do
      user = User.new
      user.save(validate: false)
      user.articles.create({ title: 'title', text: 'text' })
      expect(user.articles.empty?).to eq(false)
    end
  end
end
