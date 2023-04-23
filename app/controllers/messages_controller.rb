class MessagesController < ApplicationController
  before_action :authenticate_user!

  def create
    @message = Message.new(message_params)
    @message.user = current_user
    receiver_type = params[:message][:receiver_type]

    if receiver_type == "User"
      @message.receiver = User.find(params[:message][:receiver_id])
    elsif receiver_type == "Group"
      @message.receiver = Group.find(params[:message][:receiver_id])
    end
  
    if @message.save
      if receiver_type == "User"
        MessagesChannel.broadcast_to(@message.receiver, render_to_string(partial: "home/message", 
          locals: { msg: @message }))
        MessagesChannel.broadcast_to(@message.user, render_to_string(partial: "home/message", 
          locals: { msg: @message }))
      elsif receiver_type == "Group"
        GroupChannel.broadcast_to(@message.receiver, render_to_string(partial: "groups/message", 
          locals: { msg: @message }))
      end
    else
      render  status: :unprocessable_entity
    end
  end
  

  private
  
  def message_params
    params.require(:message).permit(:content, :receiver, :receiver_type, :receiver_id, :images)
  end
end
