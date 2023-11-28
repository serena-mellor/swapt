class ItemsController < ApplicationController


  private

  def items_params
    params.require(:item).permit(:title, :description, :photo)
  end
end
