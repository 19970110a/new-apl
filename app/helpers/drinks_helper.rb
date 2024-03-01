module DrinksHelper
  def image_filename_for_category(category_id)
    case category_id
    when 1 
      "beer.png"
    when 2 
      "sour.png"
    when 3 
      "highball.png"
    when 4
      "shochu.png"
    when 5
      "sake.png"
    when 6
      "wine.png"
    # その他のカテゴリーに対する画像ファイル名を追加
    else
      "default.png"
    end
  end
end