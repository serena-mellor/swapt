class ItemsController < ApplicationController
skip_before_action :authenticate_user!, only: [:index, :show]

  def show
    @item = Item.find(params[:id])
  end

  def index
    @items = Item.where(swappable: true).where.not(user: current_user)
  end

  def new
    @item = Item.new
  end

  def destroy
    @item = Item.find(params[:id])
    @item.destroy
    redirect_to items_path
  end

  def create
    @item = Item.new(items_params)
    @item.user = current_user
    if @item.save
      redirect_to item_path(@item)
    else
      render :new, status: 422
    end
  end

  def update
    @item = Item.find(params[:id])
    @item.update(items_params)
    redirect_to items_path
  end
  private

  def items_params
    params.require(:item).permit(:title, :description, :swappable, :category_id, :photo)
  end
end
