class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home, :landing]

  def landing
  end

  def home
  end

  def menu
    # @options = ["My Closet", "Explore", "Swappable Items", "Categories"]
  end
end
