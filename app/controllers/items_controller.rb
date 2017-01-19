class ItemsController < ApplicationController
  before_action :authorize_user, except: [:index, :show]
  
  def index
    @items = Item.all
  end

  def show
    @item = Item.find(params[:id])
    @reviews = @item.reviews
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    @item.user = current_user

    if @item.save
      flash[:notice] = "You made a Thing"
      redirect_to @item
    else
      flash[:notice] = @item.errors.full_messages.to_sentence
      render :new
    end
  end

  def edit
    @title = Item.find(params[:id]).title
    @item = Item.find(params[:id])
  end

  def update
    @item = Item.find(params[:id])

    if @item.update(item_params)
      flash[:notice] = "You edited a Thing"
      redirect_to @item
    else
      @title = Item.find(params[:id]).title
      flash[:notice] = @item.errors.full_messages.to_sentence
      render :edit
    end
  end

  def destroy
    @item = Item.find(params[:id])
    @item.destroy
    flash[:notice] = "You deleted a Thing"
    redirect_to items_path
  end

  private

  def item_params
    params.require(:item).permit(:title, :description)
  end

  def authorize_user
    if !user_signed_in?
      raise ActionController::RoutingError.new("Not Found")
    end
  end

end
