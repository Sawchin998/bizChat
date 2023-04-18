class GroupsController < ApplicationController
  before_action :authenticate_user!

  def index
    @groups = Group.all
  end

  def new
    @group = Group.new
  end

  def create
    @group = Group.new(group_params)
    @group.admin = current_user

    if @group.save
      @group.users << current_user
      redirect_to groups_url
    else
      render "new", status: :unprocessable_entity
    end
  end

  private

  def group_params
    params.require(:group).permit(:name, :avatar)
  end
end
