class HomeController < ApplicationController
  before_action :require_login

  def top
    @user = current_user
    if @user
      # その日の全ての記録を取得し、最新のアルコール分解時間を計算します
      todays_records = @user.records.where('created_at >= ?', Time.zone.now.beginning_of_day)
      total_alcohol_grams = todays_records.sum(:alcohol_grams)
      decompose_rate = @user.weight * 0.1
      hours_to_decompose = total_alcohol_grams / decompose_rate
  
      # 現在時刻から分解開始時刻を引いて、既に経過した時間を計算します
      if todays_records.any?
        time_since_last_drink = Time.current - todays_records.last.created_at
        elapsed_hours = time_since_last_drink / 1.hour
        hours_to_decompose -= elapsed_hours
      end
  
      @hours = hours_to_decompose.floor
      @minutes = ((hours_to_decompose - @hours) * 60).round
      @speech_text = "あと#{@hours}時間#{@minutes}分でアルコールが抜けるよ！" if hours_to_decompose > 0
    end
  
    @random_speech = RandomSpeech.order('RANDOM()').first unless @speech_text
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
  private

  def calculate_additional_hours(records)
    last_record = records.order(created_at: :desc).first
    return 0 unless last_record

    time_difference = Time.current - last_record.created_at
    additional_hours = time_difference / 1.hour

    return additional_hours
  end


  def drinking_graph
    # 飲酒データを集計するロジック
  end

  def share
    # 必要なデータを準備する
  end

  def require_login
    unless logged_in?
      redirect_to login_path, alert: 'ログインが必要です。'
    end
  end
  
end
