module DrinksHelper
  def image_filename_for_drink(drink_name)
    # ドリンク名に基づいて画像ファイル名をマッピング
    mapping = {
      "ビール" => "beer.png",
      "サワー" => "sour.png",
      "ハイボール" => "highball.png",
      "焼酎" => "shochu.png",
      "日本酒" => "sake.png",
      "ワイン" => "wine.png",
      # その他のドリンク名に対するマッピングを追加
      "その他" => "other.png"
    }
    # マッピングから画像ファイル名を取得、デフォルトは "default.png"
    mapping[drink_name] || "default.png"
  end
end