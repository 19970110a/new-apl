class DrinksController < ApplicationController
  def choose
    @drinks = Drink.all
  end

  def increment
    @drink = Drink.find(params[:id])
    # ここで数量を増やす処理
    respond_to do |format|
      format.turbo_stream
      format.html { redirect_to drinks_path } # 必要に応じて修正
    end
  end

  def decrement
    @drink = Drink.find(params[:id])
    # ここで数量を減らす処理
    respond_to do |format|
      format.turbo_stream
      format.html { redirect_to drinks_path } # 必要に応じて修正
    end
  end
end