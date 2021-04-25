require 'rails_helper'

RSpec.describe "UserFlows", type: :request do
  describe "Post log in" do
    it "User logs in" do
      post '/login',
        params: {user: {id: '2', name: 'janpala'}}
      assert_response :redirect
      follow_redirect!
      assert_response :success
    end
  end

  describe "Post Articles" do
    it "Creates an Article" do
      post "/articles",
        params: {article: {author_id: '2', 
                  title: 'Title', 
                  text:'This is a body of text',
                  string: 'ImageUrl.com',
                  category_id: '2'}}
      assert_response :redirect
      follow_redirect!
      assert_response :success
    end
  end

  describe "Post Votes" do
    it "Votes on an Article" do
      post '/articles/2/votes',
        params: {vote: {user_id: "2", article_id: "2"}}
      assert_response :redirect
      follow_redirect!
      assert_response :success
    end
  end
end
