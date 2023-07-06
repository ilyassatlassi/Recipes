class FoodsController < ApplicationController
  # before_action :set_food, only: %i[ show edit update destroy ]

  # GET /foods or /foods.json
  def index
    @foods = current_user.foods.includes(:user)
  end

  # GET /foods/new
  def new
    @food = current_user.foods.build
  end

  # POST /foods or /foods.json
  def create
    @food = current_user.foods.build(food_params)
    if @food.save
      redirect_to foods_path, notice: 'Food was successfully created.'
    else
      render :new
    end
  end

  # DELETE /foods/1 or /foods/1.json
  def destroy
    @food = current_user.foods.find(params[:id])
    @food.destroy
    redirect_to foods_path, notice: 'Food item was successfully deleted.'
    end
  end

  private
    # Only allow a list of trusted parameters through.
    def food_params
      params.require(:food).permit(:name, :measurement_unit, :price, :quantity, :user_id)
    end
  end

