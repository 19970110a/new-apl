module Admin
  class RandomSpeechesController < ApplicationController
    before_action :require_admin

    def new
      @random_speech = RandomSpeech.new
      @characters = Character.all
    end

    def create
      @random_speech = RandomSpeech.new(random_speech_params)
      if @random_speech.save
        redirect_to new_admin_random_speech_path, notice: 'セリフが正常に登録されました。'
      else
        # 保存に失敗した場合の処理
        @characters = Character.all # 必要な変数を再設定
        render :new
      end
    end

    private

    def random_speech_params
      params.require(:random_speech).permit(:character_id, :alcohol_speeches, :random_speeches)
    end

    def require_admin
      redirect_to root_path unless current_user&.admin?
    end
  end
end