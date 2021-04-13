# rubocop:disable Style/GuardClause
class VotesController < ApplicationController
  # POST /votes or /votes.json
  def create
    @vote = current_user.votes.new(article_id: params[:article_id])

    redirect_back(fallback_location: root_path) if @vote.save
  end

  # DELETE /votes/1 or /votes/1.json
  def destroy
    vote = Vote.find_by(id: params[:id], user: current_user, article_id: params[:article_id])
    if vote
      vote.destroy
      redirect_back(fallback_location: root_path)
    end
  end
end
# rubocop:enable Style/GuardClause
