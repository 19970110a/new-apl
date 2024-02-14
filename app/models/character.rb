class Character < ApplicationRecord
  has_many :users
  has_many :random_speeches
  def image_filename
    # キャラクターに応じた画像ファイル名を返すロジック
    "#{animal.downcase}.png"
  end
end