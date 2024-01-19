class AnimalsController < ApplicationController  
     # newアクションでは、利用可能な動物のリストを設定します。
  def new
    # ここでは@animalsに全動物のレコードをセットします。
    # 実際のアプリケーションでは、データベースから動物のデータを取得することになります。
    @animals = Animal.all
  end

  # createアクションは、ユーザーが動物を選択したときに呼び出されます。
  # この例では、単純にユーザーの選択を保存していますが、
  # 実際のアプリケーションでは適切なビジネスロジックに従って処理する必要があります。
  def create
    # 選択された動物のIDをパラメータから取得し、ユーザーに関連付けます。
    # ここではcurrent_userメソッドを使用していますが、
    # これはログインしているユーザーのインスタンスを返すことを前提としています。
    # 実際の実装では、Deviseなどの認証システムを使用することが多いです。
    chosen_animal = Animal.find(params[:animal_id])
    current_user.update(animal: chosen_animal)

    # ユーザーの選択が完了したら、別のページ（例えばユーザープロファイル）にリダイレクトします。
    redirect_to user_profile_path(current_user)
  end
end
