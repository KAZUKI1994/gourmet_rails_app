#スマートデート開発者向け共有ドキュメント
##目次
- スマートデートとは
- 更新情報
- 初期共有サービス
- Bitbucketとは
- ソースコードの取得
- 開発環境
- 開発をしていく上での決め事
- サーバーの管理
- デプロイ


##スマートデート（SMARTDATE）とは
[https://smartdate.jp](https://smartdate.jp)  
関西の大学生をターゲットにしたデート特化型グルメサイト

##更新情報
- 更新日時　名前　更新内容
- 2016-03-09 東口 ドキュメントの全体的な充実
- 2016-03-10 東口　サーバーの取り扱いとデプロイ方法について共有

##初期共有サービス
- Bitbucket
- Google Drive
- Slack


##Bitbucketとは
* **githubと同じ**
* gitの**非公開レポジトリー**を**無料**で作ることができる
* SourceTreeをリリースしている会社（Atlassian）が運営しているサービス

###登録方法
* 「invite member」からメールアドレスに招待を送る（すでにbitbucketに登録している場合、ユーザー名から招待）

##ソースコードの取得
### 自分のパソコンにソースコードを入れる
*ローカル（自分のパソコンのターミナル）にて*  

* 適当なフォルダを作る
* gitの初期ファイルを作る(Comands: ``git init``)
* bitbucket上のレポジトリーを共有先として指定する

``git remote  add origin https://kazukungutikun@bitbucket.org/smartdate/smartdate.git``

* bitbucket上のソースコードをローカルにインポート

``git pull origin master``

##開発環境
###railsの立ち上げ
railsおきまりの**gemのインストール**と**データベースの作成**

``bundle install``  
``rake db:create``  
``rake db:migrate``

ただし、sqlite3をデータベースとして使う時の方法なのでデータベースを変更した際はさらにプロセスがいるかも

``rails s -b 127.0.0.1``

facebook, twitterなどと連携したものにする際にlocalhostではうまくいかないことがあるので適当なIPアドレスとして**127.0.0.1**を指定しています。

##開発していく上で決め事 
* **各自branchを切って**作業する
* 各自の作業が完了したら**作業branchをpush**する
* pushしたbranchは**masterに対してpull request**を送る
* pull requestを送った際、slackにて一言残す
* requestを**テクニカルディレクター**がコードレビューしmergeする

###pull requestの送り方
bitbucketのブラウザ上で「プルリクエスト」というメニューからプルリクエストを作成する  
[解説イメージ](https://gyazo.com/fc428cf0e911e755a4c614f2168992da)

## サーバーの管理
###契約サーバー情報
* さくらVPS石狩リージョン
* サーバへの接続方法：共通鍵暗号方式での公開鍵暗号での認証
* IP: 153.126.173.97
* [コントロールパネルへのアクセス](https://secure.sakura.ad.jp/vps/)
* [詳細情報](https://drive.google.com/open?id=0B-gJ3QY1lOBlVUp0UDRxWkV5M28)



###サーバー接続する際の下準備
公開鍵認証方式でサーバーに接続するための準備をします。
####パスワード認証でサーバーに接続してみる
まずはパスワードで自分のユーザーに認証してみる。  
※rootユーザーでの認証はセキュリティ上の設定で禁止しています。
  
``
ssh -p 50456 [user]@153.126.173.97
``  

例：``ssh -p 50456 kazuki@153.126.173.97``  
セキュリティの強化のためポート番号はdefaultの80より変更しています。

このコマンドをターミナルで打つとパスワードが聞かれます。その際に各自割り当てられたパスワードをうってください。（変更は可能）

####公開鍵・秘密鍵の作成
サーバーは公開鍵認証方式をとるためにまずは自分のパソコンの**秘密鍵・公開鍵**を作成する

- ホームディレクトリーへ(**cd ~**)
- 隠しフォルダを作成(**mkdir .ssh**)  
すでにある場合はスキップ、多分ある。
- .sshの中へ
- 公開鍵・秘密鍵を作成  
**[dotinstall：鍵認証を設定しよう](http://dotinstall.com/lessons/basic_sakura_vps/8007)を参考にする。** 

####公開鍵のパーミッションを変更する（動画内で設定済み）
``chmod 600 ~/.ssh/[file].pub``  
例：``chmod 600 ~/.ssh/id_rsa.pub``  
所有者のみ読み書き可能に変更する

####公開鍵をサーバーに送る
``scp -P 50456 ~/.ssh/[file].pub [user]@153.126.173.97:~/.ssh/authorized_keys``  
scpはlinuxの転送コマンド。  
「ポート番号50456で153.126.173.97に[user]というユーザーでローカルマシンにある~/.ssh/[file].pubというファイルをサーバーの~/.ssh/authorized_keysというファイルに対して転送する」  
という意味。  
例：
``scp -P 50456 ~/.ssh/id_rsa.pub kazuki@153.126.173.97:~/.ssh/authorized_keys`` 

####公開鍵認証方式でサーバーに接続する
``ssh -i ~/.ssh/[file] kazuki@153.126.173.97 -p 50456``

####サーバーの接続を簡単にする
これを参考に設定する  
[複数の鍵を管理する](http://superbrothers.hatenablog.com/entry/20090730/1248971671)

###サーバーの取り扱い
* git権限はrootがもつ（sudo -sで一度rootになる）

rootユーザーがbitbucketのユーザーとして扱われているため基本的にrootユーザーでサーバーをいじることになる。（多分非推奨のやり方だと思うのでなるべくrootでシステムをいじる回数は減らしたい。）


###参考URL
* [dotinstall: さくらVPSでサーバーを構築する](http://dotinstall.com/lessons/basic_sakura_vps)  
これをめちゃくちゃ参考にした。Linuxのコードが打てれば自分でもできる。
* [ssh公開鍵認証を実装する（自分メモ）](http://qiita.com/HamaTech/items/21bb9761f326c4d4aa65)  
サーバーにssh接続する際、パスワード認証ではなく**より安全な公開鍵認証を使う**  
[概念の理解にはこちら：公開鍵認証とは](http://www.adminweb.jp/web-service/ssh/index4.html)



###より高度な設定変更
#### ssh接続の設定を変更する  
/etc/ssh/sshd_config

####ユーザーを追加する
- useradd [ユーザー名] //ユーザーの追加
- passwd [ユーザー名] //ユーザーのパスワードを設定する
- usermod -G wheel [ユーザー名] //root権限を与える

### Version UP ###

##デプロイ
開発したソフトウェアを利用できるように実際の運用環境に展開することをデプロイということがある。（IT用語辞典）

###作業用ファイル
``/var/www/smartdate``
###データベースのバックアップを取る
railsはブラックボックスが多いアプリケーションフレームワークなので何が起きるかわからない。消えてしまっても大丈夫なように更新作業の前で必ずバックアップを取る

####バックアップ方法
app/db/production.sqlite3をコピーする  
（appディレクトリー内の場合）
``cp db/production.sqlite3 db/backup/production.sqlite3.[日付]``
例：
``cp db/production.sqlite3 db/backup/production.sqlite3.20160310``  
これでもしdbに異常がきたしデータが消えたということになったらbackupに取っておいたファイルに置き換えて使用する。
###サーバーのソースコードを更新する
####サーバー内にバックアップブランチを作っておく
この方法がいいかどうかはわからないけど現状の策として思わぬエラーでどうにもならなかった時用にバックアップのブランチを用意

####サーバー内のブランチ
* master（バックアップブランチ）
* beta（公開ブランチ）

####手続き
Bitbucket（ブラウザ）上で行う事

* masterの状態をproduction branchにmerge（プルリクを送ってmergeする）

サーバー上で行う事

* サーバー上でbranchをmasterにcheckoutする

``git checkout master``

* masterにbetaの内容を事前に反映させる。

``git merge beta``

* 再度betaブランチに戻る

``git checkout master``

* その後、bitbucket上のproductionブランチをpullする

``git pull origin production``

####Railsコマンドでアップデートする必要がある場合
#####1. gemのupdateが必要な場合
``bundle install``
これについては自分自身ノウハウがないのでとりあえずこれで問題はないかと思う。  
参考資料：[bundlerでの運用方法](http://qiita.com/hazy_moon/items/ea6fdbc058256bbaafe0)

#####2. dbのmigrationが必要な場合
**まず、migrateされていないmigrateファイルを確認する**  
``rake db:migrate:status``  
or  
``rake db:abort_if_pending_migrations``  
万が一過去migrateしたと思っていたがmigrateされていないファイルを見つけたら確認する。一回これでレコードが吹っ飛んだ。

問題がなかったら

``rake db:migrate RAILS_ENV=production``

#####3. cssを変更したり画像ファイルを新規に使った場合
``rake assets:precompile RAILS_ENV=production``

####ソースコードの変更を反映させる
* ウェブサーバーのミドルウェア「Apache」を再起動する

``service httpd restart``

この際に、ssl通信を使用しているため（https://）再起動するためssl証明に要する**RSA**のパスワードを打ち再起動する。  
[RSAのパスワード](smartdate)

##このドキュメントを更新する上での参考資料
###Markdown記法について
* [Learn Markdown](https://bitbucket.org/tutorials/markdowndemo)

エンジニアライクな文章作成の記述方法。文字だけで文字の強弱やサイズを指定できる。**感覚的にはHTMLを簡単に書くイメージ**。

###その他懸念事項
- 管理・保守のためのRDBSミドルウェア