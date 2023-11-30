class SwapsController < ApplicationController

  def index
    @swaps_requested = Swap.all.where(sender: current_user)
  end

  def received_swaps
    @swaps_received = Swap.all.where(receiver: current_user)
  end
  
  def create
    @swap = Swap.new
    @item = Item.find(params[:item_id])
    @swap.sender = current_user
    @swap.receiver = @item.user
    if @swap.save
      redirect_to swap_path(@swap)
    else
      redirect_to item_path(@item), status: :unprocessable_entity
    end
  end

end
