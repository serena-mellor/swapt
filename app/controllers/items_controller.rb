class ItemsController < ApplicationController
  def show
    @item = Item.find(params[:id])
    # more logic needed?
  end
end
