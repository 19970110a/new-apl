class CharactersController < ApplicationController
  def index
    @characters = Character.all
  end

  # 他のアクションを必要に応じて追加
end