class CharactersController < ApplicationController
def new
    # Characterモデルの全レコードを取得します
    @characters = Character.all
  end

  # createアクションや他のアクションはここに追加します
end
