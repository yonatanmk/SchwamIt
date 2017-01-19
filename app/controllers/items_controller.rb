class ItemsController < ApplicationController
  before_action :visitor?, except: [:index, :show]

  def index
    @items = Item.all
    @user_can_create = !current_user.nil?
  end

  def show
    @item = Item.find(params[:id])
    @reviews = @item.reviews

    @user_can_change = false
    unless current_user.nil?
      @user_can_change = can_change?(@item)
    end
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

    unless can_change?(@item)
      raise ActionController::RoutingError.new("Not Found")
    end

    @user_can_change = false
    unless current_user.nil?
      @user_can_change = can_change?(@item)
    end
  end

  def update
    @item = Item.find(params[:id])

    unless can_change?(@item)
      raise ActionController::RoutingError.new("Not Found")
    end

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

    unless can_change?(@item)
      raise ActionController::RoutingError.new("Not Found")
    end

    @item.destroy
    flash[:notice] = "You deleted a Thing"
    redirect_to items_path
  end

  private

  def item_params
    params.require(:item).permit(:title, :description)
  end

  def visitor?
    if !user_signed_in?
      raise ActionController::RoutingError.new("Not Found")
    end
  end

  def can_change?(item)
    current_user == item.user || current_user.role == "admin"
  end

end
