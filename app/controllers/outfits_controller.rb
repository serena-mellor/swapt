class OutfitsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index]

  def index
    @outfits = Outfit.all.order(created_at: :desc)
  end

  def new
    @outfit = Outfit.new
    @hats = current_user.items.select { |item| item.category.hat? }
    @tops = current_user.items.select { |item| item.category.top? }
    @middles = current_user.items.select { |item| item.category.middle? }
    @bottoms = current_user.items.select { |item| item.category.bottom? }
  end

  def create
    @outfit = Outfit.new(name: params[:outfit][:name])

    @outfit.user = current_user
    if @outfit.save
      unless params[:outfit][:hat] == "nil"
        hat = Item.find(params[:outfit][:hat])
        OutfitItem.create(outfit: @outfit, item: hat) if hat
      end
      unless params[:outfit][:top] == "nil"
        top = Item.find(params[:outfit][:top])
        OutfitItem.create(outfit: @outfit, item: top) if top
      end
      unless params[:outfit][:middle] == "nil"
        middle = Item.find(params[:outfit][:middle])
        OutfitItem.create(outfit: @outfit, item: middle) if middle
      end
      unless params[:outfit][:bottom] == "nil"
        bottom = Item.find(params[:outfit][:bottom])
        OutfitItem.create(outfit: @outfit, item: bottom) if bottom
      end
      respond_to do |format|
        format.html { redirect_to outfit_path(@outfit), status: 302 }
        format.json
      end


    else
      redirect_to new_outfit_path, status: :unprocessable_entity
    end
  end

  def show
    @outfit = Outfit.find(params[:id])
  end
end
