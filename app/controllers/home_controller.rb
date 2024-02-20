class HomeController < ApplicationController
  before_action :require_login

  def top
    @user = current_user
    if @user
      todays_records = @user.records.where('created_at >= ?', Time.zone.now.beginning_of_day)
      if todays_records.any?
        total_alcohol_grams = todays_records.sum(:alcohol_grams)
        decompose_rate = @user.weight * 0.1
        hours_to_decompose_initial = total_alcohol_grams / decompose_rate
        
        # 最初のお酒を飲んでからの経過時間を計算
        elapsed_hours_since_first_drink = (Time.current - todays_records.first.created_at) / 1.hour
        
        # 残りのアルコール分解時間を更新
        remaining_hours_to_decompose = [hours_to_decompose_initial - elapsed_hours_since_first_drink, 0].max
        
        @hours = remaining_hours_to_decompose.floor
        @minutes = ((remaining_hours_to_decompose - @hours) * 60).round
      else
        @hours = 0
        @minutes = 0
      end
  
      if @hours > 0 || @minutes > 0
        @speech_text = "あと#{@hours}時間#{@minutes}分でアルコールが抜けるよ！"
      else
        @random_speech = @user.character.random_speeches.order('RANDOM()').first if @user.character
      end
    end
    @character = @user.character if @user
  end
  def calculate_decompose_time(record)
    # 当日の全てのレコードを取得
    todays_records = @user.records.where("created_at >= ?", Time.zone.now.beginning_of_day)
    
    # 当日の全てのレコードからアルコールのグラム数を合計
    total_alcohol_grams = todays_records.sum(:alcohol_grams)
    
    # アルコールの分解率を計算（ユーザーの体重に基づく）
    decompose_rate = @user.weight * 0.1
    
    # 合計したアルコールグラム数に基づいて、アルコールが抜けるまでの時間を計算
    total_hours = total_alcohol_grams / decompose_rate
    
    # アルコールが抜けるまでの総時間を返す
    return total_hours
  end

  def calculate_additional_hours(records)
    # 最後のレコードから現在までの経過時間を計算
    last_record = records.order(created_at: :desc).first
    return 0 unless last_record

    time_difference = Time.current - last_record.created_at
    additional_hours = time_difference / 1.hour

    return additional_hours
  end



  def drinking_graph
    start_date = Time.zone.now.beginning_of_month.to_date
    end_date = Time.zone.now.end_of_month.to_date
  
    # 現在のユーザーのレコードを取得し、アルコールの総グラム数を計算
    drink_records = current_user.records.joins(:drink)
                        .where(date: start_date..end_date)
                        .group('DATE(records.date)')
                        .select('DATE(records.date) as date, ROUND(SUM(records.quantity * drinks.volume * drinks.degree / 100 * 0.8)) AS total_quantity')
  
    # 1ヶ月分の日付を生成し、各日についてアルコール摂取量があればその値を、なければ0をセット
    @chart_data = (start_date..end_date).each_with_object({}) do |date, hash|
      # drink_recordsから一致する日付のレコードを探し、見つかればその総グラム数を、見つからなければ0をセット
      matching_record = drink_records.find { |r| r.date.to_date == date }
      hash[date.strftime('%Y-%m-%d')] = matching_record ? matching_record.total_quantity.to_i : 0
    end
  end
  def check_alcohol
    @todays_records = current_user.records.where(date: Date.today)
    @total_alcohol_grams = @todays_records.sum(:alcohol_grams)
    
    # 二日酔いになった全記録を取得
    @hangover_records = current_user.records.where(hangover: true).order(date: :desc)
  end

  def share
    # 必要なデータを準備する
  end

  private

  def require_login
    unless logged_in?
      redirect_to login_url, alert: "ログインが必要です。"
    end
  end

  def logged_in?
    !!current_user
  end
  
end
