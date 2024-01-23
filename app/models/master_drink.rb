class MasterDrink < ApplicationRecord
    # モデルの関連付けやバリデーション（必要に応じて）
    has_many :user_drinks
  end