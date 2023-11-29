module ApplicationHelper

  def background_colour(params)
    if params[:controller] == "items" && params[:action] == "show"
      'background-color: #F3EDE2;'
    else
      'background-color: inherit;'
    end
  end
end
