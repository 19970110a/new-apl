class RecordsController < ApplicationController
  def create
  @record = current_user.records.build(record_params)
  @record.date = Date.today # 現在の日付を設定
  @record.alcohol_grams = calculate_alcohol_grams(@record)
  if @record.save
    redirect_to home_top_path, notice: '記録が保存されました。'
  else
    # 保存に失敗した場合の処理
    redirect_to drinks_path, alert: '記録の保存に失敗しました。'
  end
end
private

def record_params
  params.permit(:drink_id, :quantity)
end

def calculate_alcohol_grams(record)
    drink = record.drink
    # アルコールグラムの計算
    alcohol_grams = drink.volume * (drink.degree.to_f / 100) * 0.8
    alcohol_grams
  end
end