class ChatroomsController < ApplicationController

  def index
    @chatrooms = Chatroom.all.select {|chatroom| chatroom.users.include?(current_user) || chatroom.other_users.include?(current_user)}
  end

  def show
    @chatroom = Chatroom.find(params[:id])
    @message = Message.new
  end
end
