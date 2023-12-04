class OutfitsController < ApplicationController
  def new
    @outfit = Outfit.new
    @hats = Item.all.select { |item| item.category.position == "Hat" }
    @tops = Item.all.select { |item| item.category.position == "Top" }
    @middles = Item.all.select { |item| item.category.position == "Middle" }
    @bottoms = Item.all.select { |item| item.category.position == "Bottom" }
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

      redirect_to outfit_path(@outfit)

    else
      redirect_to new_outfit_path, status: :unprocessable_entity
    end
  end
end
