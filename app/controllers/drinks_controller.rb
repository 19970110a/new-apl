class DrinksController < ApplicationController
  def choose
    @master_drinks = MasterDrink.all
  end

  def increment
    @master_drink = MasterDrink.find(params[:id])
    # ここで @master_drink の数量を増やすロジックを実装
    @master_drink.save

    respond_to do |format|
      format.turbo_stream
    end
  end

  def decrement
    @master_drink = MasterDrink.find(params[:id])
    # ここで @master_drink の数量を減らすロジックを実装
    @master_drink.save

    respond_to do |format|
      format.turbo_stream
    end
  end
end