class UserDrinksController < ApplicationController
  def new
    @user_drink = UserDrink.new
    @master_drinks = MasterDrink.all
  end

  def create
    @user_drink = UserDrink.new(user_drink_params)
    if @user_drink.save
      redirect_to drinks_choose_path, notice: "お酒を作成しました！"
    else
      render :new
    end
  end

  private

  def user_drink_params
    params.require(:user_drink).permit(:name, :image, :alcohol_volume, :alcohol_percentage)
  end
end