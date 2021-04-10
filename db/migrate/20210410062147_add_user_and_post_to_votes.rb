class AddUserAndPostToVotes < ActiveRecord::Migration[6.1]
  def change
    add_foreign_key :votes, :users, column: :user_id
    add_foreign_key :votes, :articles, column: :article_id
  end
end
