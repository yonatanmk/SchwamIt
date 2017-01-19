class ReviewsController < ApplicationController
  def new
    @item = Item.find(params[:item_id])
    @review = Review.new
  end

  def edit
    @review = Review.find(params[:id])
    @item = @review.item
  end

  def update
    @review = Review.find(params[:id])

    if @review.update(review_params)
      flash[:notice] = "You edited a Thing's review"
      redirect_to @review.item
    else
      @item = @review.item
      flash[:notice] = @review.errors.full_messages.to_sentence
      render :edit
    end
  end

  def create
    @review = Review.new(review_params)
    @review.user = current_user
    @item =Item.find(params[:item_id])
    @review.item = @item

    if @review.save
      flash[:notice] = "You reviewed a Thing"
      redirect_to @item
    else
      flash[:notice] = @review.errors.full_messages.to_sentence
      render :new
    end
  end

  private

  def review_params
    params.require(:review).permit(:rating, :body)
  end
end
