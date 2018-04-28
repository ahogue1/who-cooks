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

  def show
    @group = Group.find(params[:group_id])
  end

  def users
    @users = Group.find(params[:group_id]).users
  end

   def edit
    @group = Group.find(params[:id])
  end

  def update
    @group = Group.find(params[:id])

    if @group.save
      redirect_to meals_path
    else
      redirect_to new_group_path(@meal), error: "Group couldn't be created"
    end
  end


  private

  def group_params
    params.require(:group).permit(:name, groups_users_attributes: [:user_id, :_destroy])
  end

end
