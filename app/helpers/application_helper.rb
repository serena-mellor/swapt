module ApplicationHelper

  def background_colour(params)
    if params[:controller] == "items" && params[:action] == "show"
      'background-color: #F3EDE2;'
    end
  end
end
