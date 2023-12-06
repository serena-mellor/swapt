class FavouritesController < ApplicationController
  def create
    @favourite = Favourite.new
    outfit = Outfit.find(params[:outfit_id])
    @favourite.outfit = outfit
    @favourite.user = current_user
    if @favourite.save
      respond_to do |format|
        format.json
      end
    end
  end

  def destroy
    @favourite = Favourite.find(params[:id])
    @favourite.destroy
    respond_to do |format|
      format.json
    end
  end
end
