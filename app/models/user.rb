class User < ApplicationRecord
  authenticates_with_sorcery!
  belongs_to :character, optional: true
  has_many :user_characters
  has_many :records
  has_many :drinks

  # バリデーションの追加
  validates :password, length: { minimum: 3 }
  validates :password, confirmation: true
  validates :password_confirmation, presence: true
  validates :email, uniqueness: true
  validates :reset_password_token, uniqueness: true, allow_nil: true
  validates :weight, presence: true
   # その日に飲んだアルコールの合計グラム数を取得するメソッド
   def todays_alcohol_grams
    records.where('date = ?', Date.today).sum(:alcohol_grams)
  end

  # 表示するキャラクター画像のファイル名を返すメソッド
  def character_image
    case todays_alcohol_grams
    when 0..30
      "#{character.animal}.png"
    when 31..60
      "#{character.animal}02.png"
    when 61..90
      "#{character.animal}03.png"
    else
      "#{character.animal}04.png"
    end
  end
end