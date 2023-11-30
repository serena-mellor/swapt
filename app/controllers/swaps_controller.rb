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
    @swap.requested_item = @item
    if @swap.save!
      redirect_to swaps_path
    else
      redirect_to item_path(@item), status: :unprocessable_entity
    end
  end

  def update
    @item = Item.find(params[:item_id])
    swap = Swap.find(params[:id])
    swap.update(second_item: @item)

    swap.requested_item.update(user: swap.sender)
    swap.second_item.update(user: swap.receiver)

    swap.accepted!

    redirect_to items_path
  end
end
