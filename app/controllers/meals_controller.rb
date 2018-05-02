class MealsController < ApplicationController

  def index
    @meal = Meal.new
    @group = Group.new
    @today = Date.today
    @groups = current_user.groups
    @week_days = @today.beginning_of_week..@today.end_of_week

    if @groups.any?
      @meals = Meal.where(group: @groups, date: @week_days)
    else
      redirect_to new_group_path, notice: "You don't have a group yet, let's make one!"
    end
  end

  def show
    @meal = Meal.find(params[:id])

    if @meal.recipe_id
      @recipe = @meal.recipe
    else

      if @meal.name == ""
        @recipes = EdamamService.new.search(@meal.category)
      else
        @recipes = EdamamService.new.search(@meal.name)
      end

    end
  end

  def edit
    @meal = Meal.find(params[:id])
  end

  def update
    @meal = Meal.find(params[:id])

    @recipe = Recipe.find_by(edamam_id: params[:edamam_id])

    unless @recipe
      @recipe = EdamamService.new.find(params[:edamam_id])
      @recipe.save
    end

    @meal.recipe = @recipe
    @meal.name = @recipe.label

    if @meal.save
      redirect_to meal_path(@meal)
    else
      redirect_to meal_path(@meal), error: 'Recipe not added to the meal'
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
    params.require(:meal).permit(:category, :date, :name, :user_id, :group_id, :recipe_id)
  end

end
