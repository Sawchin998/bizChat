class HomeController < ApplicationController
  before_action :authenticate_user!

  def index
    @conversations = conversation
  end

  def search
    @search = User.where("name LIKE ?",  "%#{params[:query]}%")
  end

  private

  def conversation
    @aaa = []
    @messages = Message.where("user_id = ? OR receiver_id = ?", current_user.id, current_user.id)
    # @messages.each do |msg|
    #   if msg[:receiver_type] == "Group"
        
    #   else

    #   end
    
    @aaa

  end  
end
