module Api
  class SomeController < ApplicationController
    def sober_time
      # ここで @user を設定します。適切なユーザー認証が行われていることを確認してください。
      @user = current_user

      # その日の全ての記録からアルコールのグラム数を合計
      todays_records = @user.records.where("created_at >= ?", Time.zone.now.beginning_of_day)
      total_alcohol_grams = todays_records.sum(:alcohol_grams)

      # アルコールの分解率を計算（ユーザーの体重に基づく）
      decompose_rate = @user.weight * 0.1
      
      # 合計したアルコールグラム数に基づいて、アルコールが抜けるまでの時間を計算
      hours_to_decompose = total_alcohol_grams / decompose_rate

      # 現在時刻から分解開始時刻を引いて、既に経過した時間を計算します
      if todays_records.any?
        time_since_last_drink = Time.current - todays_records.last.created_at
        elapsed_hours = time_since_last_drink / 1.hour
        hours_to_decompose -= elapsed_hours
      end

      hours = hours_to_decompose.floor
      minutes = ((hours_to_decompose - hours) * 60).round

      render json: { hours: hours, minutes: minutes }
    end
  end
end