class GroupsController < ApplicationController
  before_action :authenticate_user!
  before_action :group_admin?, only: [:edit, :update, :add_user, :remove_user, :destroy]
  before_action :group_user?, only: [:show]

  def list_user
    @group = Group.find(params[:id])
    @users = @group.users
  end

  def search
    @group = Group.find(params[:group_search][:group_id])
    @search = User.where("name LIKE ? OR email LIKE ?", "%#{params[:query]}%", "%#{params[:query]}%")
                .where.not(id: @group.users.pluck(:id))
                .order("name ASC")
  end
  

  def new
    @group = Group.new
  end

  def show
    @group = Group.find(params[:id])
  end

  def create
    @group = Group.new(group_params)
    @group.admin = current_user

    if @group.save
      @group.users << current_user
      redirect_to @group, notice: "Group was successfully created."
    else
      render "new", status: :unprocessable_entity
    end
  end

  def edit
    @group = Group.find(params[:id])
  end

  def update
    @group = Group.find(params[:id])
    if @group.update(group_params)
      redirect_to @group, notice: "Group was successfully updated."
    else
      render :edit
    end
  end

  def add_user
    @group = Group.find(params[:id])
    @user = User.find(params[:user_id])
    @group.users << @user
    redirect_to @group
  end

  def remove_user
    @group = Group.find(params[:id])
    @user = User.find(params[:user_id])
    if @user == current_user
      flash[:error] = "You cannot remove yourself from the group."
    else
      @group.users.delete(@user)
      flash[:success] = "User removed from the group."
    end
    redirect_to @group
  end

  def destroy
    @group = Group.find(params[:id])
    @group.destroy
    redirect_to root_path
  end

  private

  def group_params
    params.require(:group).permit(:name, :description)
  end

  def group_admin?
    @group = Group.find(params[:id])
    unless current_user.id == @group.admin_id
      flash[:error] = "You do not have permission to access this page."
      redirect_to @group
    end
  end

  def group_user?
    @group = Group.find(params[:id])
    unless @group.users.include?(current_user)
      redirect_to root_path, alert: "You are not a member of this group."
    end
  end
end
