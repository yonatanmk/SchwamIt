class Api::V1::VotesController < ApplicationController
  skip_before_filter :verify_authenticity_token
  before_action :load_review_and_vote

  def up_vote
    binding.pry
    update_vote!(1)
  end

  def down_vote
    update_vote!(-1)
  end

  private

  def load_review_and_vote
    @review = Review.find(params[:review_id])
    @vote = @review.votes.where(user_id: params[:current_user_id]).first
  end

  def update_vote!(new_value)
    if @vote
      if @vote.value == new_value
        @vote.update(value: 0)
      else
        @vote.update(value: new_value)
      end
    else
      @user = User.find(params[:current_user_id])
      @vote = @user.votes.create(value: new_value, review: @review)
      @vote.save
    end
    @review.update_score!
  end
end
