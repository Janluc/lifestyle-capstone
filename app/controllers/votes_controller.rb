class VotesController < ApplicationController
  # POST /votes or /votes.json
  def create
    @vote = current_user.votes.new(article_id: params[:article_id])

    if @vote.save
      redirect_to articles_path
    end
  end

  # DELETE /votes/1 or /votes/1.json
  def destroy
    vote = Vote.find_by(id: params[:id], user: current_user, article_id: params[:article_id])
    if vote
      vote.destroy
      redirect_to articles_path
    end
  end

end