class MealsController < ApplicationController
  before_action :authenticate_user!, only: [:create, :new, :edit, :update, :destroy]

  def index
    @meals = Meal.order(created_at: :desc)
  end

  def new
    @meal = Meal.new
  end

  def create
    @meal = Meal.new(meal_params)
    @meal = current_user.meals.new(meal_params)
    if @meal.save
      redirect_to meals_path, notice: '食事情報が投稿されました。'
    else
      render :new
    end
  end

  def show
    @meal = Meal.find(params[:id])
    #@co2_reduction = @meal.calculate_co2_reduction
    #@total_nutrients = @meal.total_nutrients
  end

  def edit
    @meal = Meal.find(params[:id])
  end

  def update
    @meal = Meal.find(params[:id])
    if @meal.update(meal_params)
      redirect_to @meal, notice: '食事内容が更新されました。'
    else
      render :edit
    end
  end

  def destroy
    @meal = Meal.find(params[:id])
    @meal.destroy
    redirect_to meals_path, notice: '食事内容が削除されました。'
  end

  private

  def meal_params
    params.require(:meal).permit(:name, :description, :meal_time, :image)
  end
end
