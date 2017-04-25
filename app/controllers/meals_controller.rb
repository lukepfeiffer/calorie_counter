class MealsController < ApplicationController
  expose :meal
  expose :food do
    Food.new
  end
  expose :foods do
    Meal.find(params[:id]).foods
  end
  expose :meals do
    current_user.meals
  end

  def index
  end

  def create
    meal.user_id = current_user.id
    if meal.save
      redirect_to meal_path(meal.id)
    else
      render new_meal_path
    end
  end

  private

  def meal_params
    params.require(:meal).permit(
      :name,
      :user_id,
      :time_eaten,
      :date_eaten
    )
  end
end
