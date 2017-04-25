class FoodsController < ApplicationController
  expose :food
  expose :foods do
    Meal.find(params[:id]).foods
  end
end
