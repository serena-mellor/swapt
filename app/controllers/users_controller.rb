class UsersController < ApplicationController
  def show
    # Any users show page
  end

  def profile
    # My own show page
  end

  def my_closet
    @items = current_user.items
  end

  def closet
    @user = User.find(params[:user_id])
    @items = @user.items.where(swappable: true).reject { |item| Swap.all.any? { |swap| swap.requested_item == item && swap.status == "pending" }}
  end
end
