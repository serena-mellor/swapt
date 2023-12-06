class ItemsController < ApplicationController
skip_before_action :authenticate_user!, only: [:index, :show]

  def show
    @item = Item.find(params[:id])
  end

  def index

  @items = Item.where(swappable: true).where.not(user: current_user)
  @items = @items.search_by_title_and_description(params[:query]) if params[:query].present?
  @items = @items.where(category_id: params[:category_id]) if params[:category_id].present?
  @items = @items.where(user_id:User.near(current_user.address, params[:distance]).map(&:id)) if params[:distance]

  if params[:sort] == "newest"
    @items = @items.order(created_at: :desc)
  elsif params[:sort] == "alphabetical"
    @items = @items.order(:title)
  end

    respond_to do |format|
      format.html {
        @markers = @items.map do |item|
          {
            lat: item.user.latitude,
            lng: item.user.longitude,
            info_window_html: render_to_string(partial: "info_window", locals: {item: item})
          }
        end
      }
      format.text { render partial: 'items_list', locals: { items: @items }, formats: [:html] }
    end

  end

  def new
    @item = Item.new
  end

  def destroy
    @item = Item.find(params[:id])
    @item.destroy
    redirect_to items_path
  end

  def create
    @item = Item.new(items_params)
    @item.user = current_user
    if @item.save
      redirect_to item_path(@item)
    else
      render :new, status: 422
    end
  end

  def update
    @item = Item.find(params[:id])
    @item.update(items_params)
    redirect_to items_path
  end

  private

  def items_params
    params.require(:item).permit(:title, :description, :swappable, :category_id, :photo)
  end

# app/controllers/items_controller.rb
  def search
    @location = params[:location]
    @items = Item.near(@location, 10) # Adjust the distance as needed
  end
end
