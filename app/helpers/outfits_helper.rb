module OutfitsHelper

  def item_height(item)
    if item.category.hat?
      100
    elsif item.category.middle?
      250
    elsif item.category.bottom?
      150
    elsif item.category.dress?
      300
    else
      200
    end
  end

  def item_width(item)
    if item.category.hat?
      150
    elsif item.category.bottom?
      150
    else
      200
    end
  end
end
