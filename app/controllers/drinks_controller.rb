class DrinksController < ApplicationController
  def new
    @drink = Drink.new
  end

  def create
    @drink = current_user.drinks.build(drink_params)
    if @drink.save
      redirect_to choose_drink_path, notice: 'お酒が登録されました。'
      # 保存が成功した場合は、ここでアクションが終了するため、returnを明示的に記述する必要はありません。
    else
      # 保存に失敗した場合は、エラーメッセージをログに出力し、newテンプレートをレンダリングします。
      logger.debug @drink.errors.full_messages
      render :new
      # renderの後には他の処理を書かないようにしてください。
    end
  end


  def choose
    @drinks = current_user.drinks
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

  private

  def drink_params
    params.require(:drink).permit(:name, :degree, :volume, :category_id)
  end
end