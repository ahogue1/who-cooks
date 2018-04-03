class MealsController < ApplicationController

  def index
    @meal = Meal.new
    @today = Date.today
    @groups = current_user.groups
    @week_days = @today.beginning_of_week..@today.end_of_week

    @meals = Meal.
      where(group: @groups).
      where(date: @week_days)
  end

  def show
    @meal = Meal.find(params[:id])
    if @meal.name == ""
      @recipes = EdamamService.new.search(@meal.category)
    else
      @recipes = EdamamService.new.search(@meal.name)
    end
  end

  def create
    @meal = Meal.new(meal_params)

    if @meal.save
      redirect_to meals_path
    else
      redirect_to meals_path, error: "Meal not saved complete all fields"
    end

  end


  private

  def meal_params
    params.require(:meal).permit(:category, :date, :name, :user_id, :group_id)
  end

end
