class RecordsController < ApplicationController
  def create
  params[:records].each do |drink_id, record_param|
    quantity = record_param[:quantity].to_i
    next if quantity < 1 # 数量が1未満のものはスキップ
    record = current_user.records.build(drink_id: drink_id, quantity: quantity)
    record.date = Date.today
    record.alcohol_grams = calculate_alcohol_grams(record)
    unless record.save
      redirect_to choose_drinks_path, alert: '記録の保存に失敗しました。'
      return
    end
  end
  redirect_to home_top_path, notice: '記録が保存されました。'
  end
private

def record_params
  params.permit(:drink_id, :quantity)
end

def calculate_alcohol_grams(record)
    drink = Drink.find(record.drink_id)
    alcohol_grams = drink.volume * (drink.degree.to_f / 100) * 0.8 * record.quantity.to_i
    alcohol_grams
  end
end