import "bootstrap"
document.addEventListener('turbolinks:load', () => {
  // 動的に追加された要素をキャッチするためのイベント委譲
  document.querySelector('.drink-list').addEventListener('click', (event) => {
    // インクリメントまたはデクリメントボタンからのクリックイベントかをチェック
    if (event.target.classList.contains('increase')) {
      // デフォルトのフォーム送信を防止
      event.preventDefault();
      // 対応する数量表示を見つけて、その値をインクリメント
      const quantityDisplay = event.target.closest('.drink-item').querySelector('.quantity');
      quantityDisplay.textContent = parseInt(quantityDisplay.textContent) + 1;
    } else if (event.target.classList.contains('decrease')) {
      event.preventDefault();
      const quantityDisplay = event.target.closest('.drink-item').querySelector('.quantity');
      let currentQuantity = parseInt(quantityDisplay.textContent);
      if (currentQuantity > 0) { // 負の数量を避ける
        quantityDisplay.textContent = currentQuantity - 1;
      }
    }
  });
});