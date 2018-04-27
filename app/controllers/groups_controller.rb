class GroupsController < ApplicationController

  def new
    @group = Group.new
  end

  def create
    @group = Group.new(group_params)

    if @group.save
      redirect_to meals_path, notice: "Group Created!"
    else
      render :new
    end
  end

  def users
    @users = Group.find(params[:group_id]).users
  end

  private

  def group_params
    params.require(:group).permit(:name, groups_users_attributes: [:user_id, :_destroy])
  end

end
