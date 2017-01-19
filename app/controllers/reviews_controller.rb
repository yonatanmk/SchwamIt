class ReviewsController < ApplicationController
  def new
    @item = Item.find(params[:item_id])
    @review = Review.new
  end

  def create
    @review = Review.new(review_params)
    @review.user = current_user
    @item =Item.find(params[:item_id])
    @review.item = @item

    if @review.save
      flash[:notice] = "You reviewed a Thing"
      redirect_to @item
    end
  end

  def destroy
    @review = Review.find(params[:id])
    @item = @review.item
    @review.destroy
    flash[:notice] = "You deleted a Thing's review"
    redirect_to @item
  end

  private

  def review_params
    params.require(:review).permit(:rating, :body)
  end
end
