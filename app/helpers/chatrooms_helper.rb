module ChatroomsHelper


  def name(chatroom)
    if current_user == chatroom.swap.receiver
    "#{chatroom.swap.sender.username}"
    else
      "#{chatroom.swap.receiver.username}"
    end
  end
end
