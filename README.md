■サービス概要
お酒を使った育成ゲーム
自分で飲んだお酒を登録するとキャラクターが飲んで成長するシステム
お酒を飲んだ分でアルコールが抜けるまでの時間と二日酔いになってしまった時の記録を知らせてくれるキャラクターが出てくる。

■ このサービスへの思い・作りたい理由
私自身お酒が大好きであること、そしてゲームが大好きなのでそれを掛け合わせました。
アプリを作るなら楽しいと感じるアプリ、飲み会で話題になるアプリを作りたいと思ったため、
このサービスにしました。

■ ユーザー層について
20~45歳のお酒好きな男性、女性。
お酒が飲める年齢であること。
そしてゲームなのでより年齢が高くなるほど手を出しづらくなるため45歳ぐらいまでと位置付けました。

■サービスの利用イメージ
飲酒した時にお酒を登録するとキャラクターがお酒を飲んでアルコールが抜けるまでの時間を教えてくれます。
また二日酔いになってしまった際に二日酔いになったと登録すると、二日酔いに達した飲酒をする度に通知を届くようになり、
二日酔い防止になります。
また育成ゲームとしてあるため親密度レベルを設けて喋る内容を増やしていったり、継続すると太っていくようにしたいと思っています。

■ ユーザーの獲得について
Xでの発信によりユーザー獲得と、飲み会の場などでの話題としてのユーザー確保を考えております。

■ サービスの差別化ポイント・推しポイント
アルコールが抜けるまでの時間を計算してくれるアプリはありますが、育成ゲームと組み合わせたもの、
そしてお酒でキャラクターを育てるというアプリは調べてもなかったため差別化したポイントであると考えております。
新規ユーザーが飲み会などで一度試してみる。育成面に興味を持って家飲みなどで触って継続してくれると考えております。
正直に酔った状態でアプリを開くのはハードルが高いと思います。（特に飲み会などで何回も開くのはストレス）
ですが家で飲むときなどは触りやすいかなと思います。なのでしっかり触るとすれば家飲みであることを想定しています。（これに関しては個人的な感想であり、個人差があると思います。）
またあまり負担にならないようにお酒を登録する際には簡単な操作で実装できるようにしたいと思っています。
■ 機能候補
[]MVPリリース
  ユーザー登録機能
  ログイン機能
  飲んだお酒を選択する機能
  お酒登録機能(自分で作ったお酒等)
  キャラクター育成機能
  アルコール抜けるまでの計算機能
  グラフ機能（飲酒量の推移）
　細かい案
　　[]キャラクター育成機能に対しては
　　キャラクターは自身で用意しようと思っています。案としてはドット絵かデフォルメされた可愛い動物を書こうかと思っています。中身として　　は親密度レベルでセリフが変わる。体型が変わる。服が変わる。ランダムで体調の変化が出る。お酒に関わる会話機能。（中身として自分がで　　きる範囲で実装してみたいと思います。）

　　[]アルコールが抜けるまでの時間は
　　体重（kg）×　0.1　=　1時間で分解できるアルコール量（g）
　　お酒の量（ml）×　アルコール濃度（度数/100）×　0.8（アルコール比重）=　アルコール量（g）
　　この計算式をコードで記述して実装したいと思います。
　　体重など登録画面で登録予定です。
　　ただし、お酒のアルコールが抜けるのは計算できますが個人差があるため確実ではないことを利用規約やキャラクターのセリフに出すようにす　　る予定です。

[]本リリース
  Xでの共有機能
  lineログイン機能
■ 機能の実装方針予定
Twitter API（tweet機能のため）
通知機能