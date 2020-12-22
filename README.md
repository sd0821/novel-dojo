# アプリ名  
## NOVEL-DOJO  

# 概要  
**NOVEL-DOJO** は、小説投稿サービスです。  

# 本番環境  
### **http://54.65.65.196/**  

ログイン情報(テスト用)  
  ・Eメールアドレス：abmple@sample.jp  
  ・パスワード：1111qqqq  

# 制作背景  
制作しようと思ったきっかけは主に２点あります。  
①  
自分が元々、二次創作が好き（妄想好き）  
アニメ、映画、小説、歴史などに対して  
自らの妄想を文章化し、多くの人に読んでもらい共感してもらう、
語らいの場を作りたいと思った為です。  
②  
二次創作を知ってもらえるきっかけにしたい  
誰でも気軽に投稿できるので、多くの人に読んで貰う、または書いて貰い、二次操作の知るきっかにしたいと思いました。  

# DEMO  
![ログイン画面](https://i.gyazo.com/235b4b7a433a8dbd210f749c4f7a5977.png)  
ユーザー登録を行います。  

![ホーム画面](https://i.gyazo.com/b42495c8f52cb77f71bedf6e7e858d9d.png)  
ホーム画面です。  
ユーザー変更・小説のタイトル設定のボタンがあります。  
アプリ投稿された小説が、全投稿小説一覧で確認できます。  
小説タイトル名をクリックすると該当する小説のページに遷移します。  

![タイトル名記入画面](https://i.gyazo.com/dd5b09fcc5b5bbee2e3f8705edb9c272.png)  
タイトル名記入画面です。
投稿する小説のタイトルを設定します。  

![ホーム画面にタイトル追加](https://i.gyazo.com/63efa52e2a7a71acdbd7a203af49bedd.png)  
設定したタイトルはユーザー変更ボタンの下に追加していきます。  

![ボリューム画面](https://i.gyazo.com/256ef802934a993a15d9a36e626cced4.png)  
自分で設定したタイトル名をクリックすると上記の画面に遷移します。  
自分で設定したタイトル名の場合以下のボタンがあります。  
**Delete**(タイトル名とタイトルに付随する話数と感想)・**edit**（タイトル名を編集）・**投稿**(話数を投稿)  
全員が押せるボタンとして、**Top**(ホーム画面に戻る)・**感想**(感想を入力する画面に遷移)があります。 

![ボリューム画面投稿ボタンをクリック](https://i.gyazo.com/2463da4f9d9956dccea01367a9204643.png)  
投稿ボタンをクリックすると上記の画面に遷移します。  
題名と内容を入力して設定します。

![話数を追加ボリューム画面](https://i.gyazo.com/580fbe911d3335925106b82ade3453de.png)  
話数を追加すると上記の画像のように追加されます。  
話数をクリックすると以下のようになります。  

![話数をクリックしたボリューム画面](https://i.gyazo.com/8ca2e3d74f629872b75bd3fdf24f7380.png)  
自分で設定したタイトル名の場合以下のボタンがあります。  
**Delete**(該当する話数を削除)・**edit**（題名と内容を編集）  
全員が押せるボタンとして、**TOP**(ホーム画面に戻る)・**Index**(話数一覧の画面に遷移)があります。  

![感想画面](https://i.gyazo.com/8359508e3ea26dbebc191565a42538a5.png)  
感想ボタンをクリックすると上記の画面に遷移します。  
感想を入力すると以下のようになります。  

![感想入力後](https://i.gyazo.com/694376172ea64bfc2c171c1e56b14e71.png)  
全員が押せるボタンとして、**TOP**(ホーム画面に戻る)・**Index**(話数一覧の画面に遷移)があります。  

# 工夫した点  
誰がどのタイトル名の小説の題名と内容を投稿したかわかるように、タイトルのルーティングに
題名と内容のルーティングをネストさせました。  
こうすることで、タイトルidを取得した、
題名と内容のデータをテーブルに保存することができました。  
その為、タイトル名を削除・変更した際も、結果を題名と内容にも反映させることが出来ました。  

# 使用技術(開発環境)  

Ruby/RubyonRails/MySQL/Github/GithubDesktop/AWS/VisualStudioCode/Haml/Sass  

# 今後実装したい機能  
・感想投稿を非同期通信に変更  
・いいね機能の追加  

# DB設計  
## usersテーブル
|Column|Type|Options|
|------|----|-------|
|name|string|null: false|
|mail|string|null: false|default: “”|
|password|string|null: false|default: “”|
|encrypted_password|string|null: false|default: “”|

### Association
- has_many :titles
- has_many :volumes, through: :titles
- has_many :comments


## titlesテーブル
|Column|Type|Options|
|------|----|-------|
|name|string|null: false|
|user_id|references|null: false,foreign_key:true|

### Association
- belongs_to :user
- has_many :volumes, dependent: :destroy
- has_many :comments, dependent: :destroy
- has_many :novels


## novelsテーブル
|Column|Type|Options|
|------|----|-------|

### Association
- belongs_to :title

## volumesテーブル
|Column|Type|Options|
|------|----|-------|
|user_id|references|null: false, foreign_key: true|
|title_id|references|null: false, foreign_key: true|
|name|string|null: false|
|content|text|null: false|

### Association
- belongs_to :title, optional: true
- has_one :user, through: :title


## commentsテーブル
|Column|Type|Options|
|------|----|-------|
|user_id|references|null: false, foreign_key: true|
|title_id|references|null: false, foreign_key: true|
|comment|string|null: false|

### Association
- belongs_to :title, optional: true
- belongs_to :user
