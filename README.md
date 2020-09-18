![golfour](https://user-images.githubusercontent.com/61932860/93550727-fe9fe300-f9a6-11ea-8f6d-8d1aadb53186.png)

## 概要
「ゴルフを楽しもう！」  
GolfOurはゴルフ初心者向けの、練習内容を投稿して共有・管理するサービスです。
## URL
https://www.golfour-app.xyz  
【ゲストユーザーでログイン】ボタンからゲストユーザーとして簡単にログインできます。   
お気軽にお使いください。  
## 作成の背景
私は大学院に入学したことをきっかけに、ゴルフを始めました。  
ゴルフを始めてからの現在までの約4年間に「ゴルフを始めたい!」という友人や会社の同僚にゴルフを教えることが何度もありました。  
その経験の中でゴルフ初心者が直面する大きな課題があると感じていました。  

それは『上達が難しく、早い段階で挫折してしまう』ことです。

ゴルフが難しいのは事実です。しかし、だからこそ「やりがいがあって長く楽しめるスポーツ」だと私は思っています。挫折しないためには、挫折しやすい初心者の期間をどれだけ楽しめるかが重要です。  

そこで「初心者がゴルフを楽しめる仕組み」を取り入れたサービスとしてGolfOurを作成しました。  

## ペルソナ
性別：　男女どちらも  
年齢：　20代の社会人2〜5年目(ある程度の経済力があり、高価なゴルフ道具を購入できる年齢)  
居住地：　地方・郊外(練習場・ゴルフ場が豊富で環境が整っている地域)  
ゴルフ歴：　練習回数0~10回程度でまだコースデビューしていない人

## メイン機能
GolfOurのメイン機能は2つあります。
### 1. 練習内容を投稿して共有する
![training_post](https://user-images.githubusercontent.com/61932860/93555601-6529fe80-f9b1-11ea-8d06-af7bc6815414.png)

【練習記録を投稿】から練習した内容を記入して投稿します。  
練習時間や練習で打った球数を記入する他に、練習の中で見つかった課題をチェックボックス形式で選択します。  
また、練習した場所を記入して【練習した場所を検索】ボタンを押すとGoogleMap上に練習場所が表示されるようになっています。  

練習した内容を振り返って投稿・共有することで、練習効率とモチベーションを向上させることができます。  

### 2. 投稿した練習内容をチャート化して管理する
![training_record](https://user-images.githubusercontent.com/61932860/93555615-707d2a00-f9b1-11ea-847e-09717fb426d8.png)

【練習記録】から自分の投稿した練習内容をチャート化した物を見ることができます。
課題の内訳が円グラフで表示されているので、自分がどこでよく悩んでいるのかが直感的にわかり、次の練習に活かしやすい仕様になっています。  
また、練習時間を表示している棒グラフを見れば、今月はどれぐらい練習したかがわかるので、モチベーションの維持にも効果的です。 

【みんなの悩み】では全ユーザーの投稿内容を集めて課題・悩みをチャート化したデータを見ることができます。
自分以外の悩みを見て共感できるので、他の人と一緒に練習している雰囲気を感じることが出来ます。

### 基本機能一覧
・新規投稿機能  
・一覧表示機能、詳細表示機能  
・編集機能 、削除機能  
・ログイン機能  
・検索機能  
・いいね機能  
・位置情報投稿機能（GoogleMapAPIの利用）  
・投稿データからグラフ作成機能 

## 使用技術・環境
### 【フロントエンド】
・Bootstrap4  
・HTML(Slim,CSS(Sass)  
・JavaScript  

### 【バックエンド】
・Ruby 2.5.1  
・Ruby on Rails 5.2.4  

### 【データベース】
・MySQL2  

### 【開発環境】
・Docker, docker-compose  

### 【本番環境】
・AWS(VPC/EC2/ALB/RDS/Route53)  
・Nginx、Unicorn  
・Capistrano  
・CircleCI/CD  

### 【その他使用技術】
・Git,GitHub  
・RSpec  
・Rubocop  

## インフラ構成図
![aws-infra](https://user-images.githubusercontent.com/61932860/92693800-13fe8700-f381-11ea-95ad-2f2d7843f270.png) 

## 特に力を入れた点
1. 使い続けたくなる機能
