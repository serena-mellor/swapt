class UsersController < ApplicationController
  def show
    # Any users show page
  end

  def profile
    # My own show page
  end

  def closet
    @items = current_user.items
  end
end
