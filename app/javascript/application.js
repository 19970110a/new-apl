// Entry point for the build script in your package.json
import "@hotwired/turbo-rails"
import "./controllers"
import "~bootstrap/scss/bootstrap";
document.addEventListener('DOMContentLoaded', (event) => {
    function updateTime() {
      let timeDiv = document.getElementById('time-to-sober');
      let hours = parseInt(timeDiv.getAttribute('data-hours'));
      let minutes = parseInt(timeDiv.getAttribute('data-minutes'));
  
      // 時間をデクリメント
      if (minutes > 0) {
        minutes -= 1;
      } else if (hours > 0) {
        hours -= 1;
        minutes = 59;
      }
  
      // 更新された時間をデータ属性と表示にセット
      timeDiv.setAttribute('data-hours', hours);
      timeDiv.setAttribute('data-minutes', minutes);
      document.getElementById('time-display').textContent = `${hours}時間${minutes}分`;
  
      // アルコールが完全に抜けたらタイマーを止める
      if (hours <= 0 && minutes <= 0) {
        clearInterval(timer);
        document.getElementById('time-display').textContent = 'アルコールが抜けました！';
      }
    }
  
    // 1分ごとにupdateTimeを実行する
    let timer = setInterval(updateTime, 60000);
  });
  