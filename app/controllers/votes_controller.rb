class VotesController < ApplicationController
  before_action :load_review_and_vote

  def up_vote
    update_vote!(1)
    redirect_to :back
  end

  def down_vote
    update_vote!(-1)
    redirect_to :back
  end

  private

  def load_review_and_vote
    @review = Review.find(params[:review_id])
    @vote = @review.votes.where(user_id: current_user.id).first
  end

  def update_vote!(new_value)
    if @vote
      @vote.update(value: new_value)
    else
      @vote = current_user.votes.create(value: new_value, review: @review)
      @vote.save
    end
    @review.update_score!
  end
end
