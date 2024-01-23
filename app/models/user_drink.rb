class UserDrink < ApplicationRecord
    # モデルの関連付けやバリデーション（必要に応じて）
    belongs_to :user
    belongs_to :master_drink
  end