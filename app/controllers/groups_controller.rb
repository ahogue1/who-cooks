class GroupsController < ApplicationController

  def new
    @group = Group.new
  end

  def create
    @group = Group.build(group_params, current_user)

    if @group.save
      redirect_to meals_path, notice: "Group Created!"
    else
      render :new
    end
  end


  private

  def group_params
    params.require(:group).permit(:name)
  end

end
