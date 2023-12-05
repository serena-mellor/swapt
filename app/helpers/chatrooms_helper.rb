module ChatroomsHelper


  def name(chatroom)
    if current_user == chatroom.swap.receiver
    "#{chatroom.swap.sender.username.capitalize}"
    else
      "#{chatroom.swap.receiver.username.capitalize}"
    end
  end
end
