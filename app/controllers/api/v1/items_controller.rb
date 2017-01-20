class Api::V1::ItemsController < ApplicationController
  skip_before_filter :verify_authenticity_token

  def show
    @item = Item.find(params[:id])
    @reviews = @item.reviews
    render json: @reviews
  end
end
