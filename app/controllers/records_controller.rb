class RecordsController < ApplicationController
    before_action :require_login
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

  def mark_hangover
    # 昨日のアルコール摂取記録を検索
    yesterday_records = current_user.records.where(date: Date.yesterday)
  
    # 昨日の記録があるかどうかをチェック
    if yesterday_records.any?
      # 昨日の記録がある場合は、それらを二日酔いとしてマーク
      yesterday_records.update_all(hangover: true)
      flash[:notice] = "昨日のアルコール摂取量を二日酔いとして記録しました。"
    else
      # 昨日の記録がない場合は、フラッシュメッセージを設定
      flash[:alert] = "昨日のアルコール摂取記録がありません。"
    end
  
    redirect_to check_alcohol_path
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