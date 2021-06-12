# rubocop:disable Metrics/BlockLength
require 'rails_helper'

RSpec.describe Article, type: :model do
  context 'article information' do
    it 'checks if article has text' do
      article = Article.new
      article.save
      expect(article.text.nil?).to eq(true)

      article2 = Article.new({ text: 'article text' })
      article2.save
      expect(article2.text.empty?).to eq(false)
    end

    it 'checks if article has a title' do
      article = Article.new
      article.save
      expect(article.title.nil?).to eq(true)

      article2 = Article.new({ title: 'article title' })
      article2.save
      expect(article2.title.empty?).to eq(false)
    end

    it 'checks if article has category' do
      article = Article.new
      article.save
      expect(article.category_id.nil?).to eq(true)

      article2 = Article.new({ category_id: 1 })
      article2.save
      expect(article2.category_id.nil?).to eq(false)
    end

    it 'checks if article has an author' do
      article = Article.new
      article.save
      expect(article.user_id.nil?).to eq(true)

      article2 = Article.new({ user_id: 1 })
      article2.save
      expect(article2.user_id.nil?).to eq(false)
    end
  end
end
# rubocop:enable Metrics/BlockLength
