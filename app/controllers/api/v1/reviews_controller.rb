class Api::V1::ReviewsController < ApplicationController
  skip_before_action :verify_authenticity_token

  def destroy
    @review = Review.find(params[:id])
    @review.destroy
    flash.now[:notice] = "You deleted a Thing's review"
  end
end
