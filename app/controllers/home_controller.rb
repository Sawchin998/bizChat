class HomeController < ApplicationController
  before_action :authenticate_user!

  def index
    @msg_users = conversation
  end

  def search
    @search = User.where("name LIKE ? OR email LIKE ?",  "%#{params[:query]}%", "%#{params[:query]}%")
                  .where.not(id: current_user.id)
                  .order("name ASC")
  end

  def show
    @user = User.find(params[:id])
  end

  private

  def conversation
    # Get the messages for the current user
    @messages = Message.where(user_id: current_user.id).or(Message.where(receiver_id: current_user.id))

    # Join the users table to get the sender and receiver information
    @users = User.joins("INNER JOIN messages ON users.id = messages.user_id OR users.id = messages.receiver_id")
              .where(messages: { id: @messages.select(:id) })
              .where.not(id: current_user.id)
              .select("users.*, MAX(messages.created_at) AS latest_message_time, messages.id AS latest_message_id")
              .group("users.id")
              .order("latest_message_time DESC")
              .distinct
  end

end
