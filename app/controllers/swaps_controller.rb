class SwapsController < ApplicationController

  def index
    @swaps_requested = Swap.where(sender: current_user, status: "pending" )
  end

  def received_swaps
    @swaps_received = Swap.all.where(receiver: current_user, status: "pedning" )
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
    if params[:status]
      swap.update(status: "denied")
      redirect_to received_swaps_path, notice: "Swap has been cancelled"
    else
      swap.update(second_item: @item)

      swap.requested_item.update(user: swap.sender)
      swap.second_item.update(user: swap.receiver)

      swap.accepted!
      chat = Chatroom.create!(swap: swap)

      redirect_to chatroom_path(chat)
    end
  end
end
