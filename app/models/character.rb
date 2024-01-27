class Character < ApplicationRecord
  has_many :users
  def image_filename
    # キャラクターに応じた画像ファイル名を返すロジック
    "#{animal.downcase}.png"
  end
end