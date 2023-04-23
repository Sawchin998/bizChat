class HomeController < ApplicationController
  before_action :authenticate_user!

  def index
    @conversations = conversation
  end

  def search
    @search = User.where("name LIKE ? OR email LIKE ?",  "%#{params[:query]}%", "%#{params[:query]}%")
  end

  def show
    @user = User.find(params[:id])
  end

  private

  def conversation
    @grp_msg = []
    @user_msg = []
    @messages = Message.where("user_id = ? OR receiver_id = ?", current_user.id, current_user.id)
    @messages.each do |msg|
      if msg[:receiver_type] == "Group"
        @grp_msg << msg
      else
        @user_msg << msg
      end
    end

    @user_msg
  end  
end
