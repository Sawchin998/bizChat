class GroupsController < ApplicationController
  before_action :authenticate_user!
  before_action :group_admin?, only: [:edit, :update]

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
end
