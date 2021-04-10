module ApplicationHelper
  def vote_btn(article)
    vote = Vote.find_by(user_id: current_user.id, article_id: article.id)
    if vote
      link_to('Vote Down', article_vote_path(id: vote.id, article_id: article.id), method: :delete)
    else
      link_to('Vote Up', article_votes_path(article_id: article.id), method: :post)
    end
  end
end
