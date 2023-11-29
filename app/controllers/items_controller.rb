class ItemsController < ApplicationController

  def new
    @item = Item.new
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

  private

  def items_params
    params.require(:item).permit(:title, :description, :swappable,:category_id, :photo)
  end
end
