# README
ながの　CAKE

**アプリケーショントップ画面**URL　"https://6f387be97a6b474caa352764a9d2e084.vfs.cloud9.ap-northeast-1.amazonaws.com"

# アプリケーション操作方法

## ・顧客側

### 1.新規登録機能

・名前（漢字、フリガナ）,メールアドレス,郵便番号,住所,電話番号,パスワードを設定できる

### 2.ログイン機能

・メールアドレスとパスワードでログインできる

### 3.ログアウト機能

・ログイン時のみ使える機能が利用できなくなる

### 4.トップ画面

・ジャンル一覧、新着商品を閲覧できる
（ログインしていない状態でも閲覧可）

### 5.商品一覧画面

・全商品の一覧が閲覧できる

・商品名をクリックすると、商品詳細画面に移る

### 6.カート機能

・商品詳細画面から、商品をカートに追加できる

・画面右上のカートマークをクリック

  カートに入れた商品が表示
 
  カート内商品の個数を’変更’ボタンで変更
 
  カート内商品を’削除’ボタンで削除
 
 ’情報入力に進む’ボタンから、注文画面に進む

### 7.注文機能

・支払方法を’クレジットカード’,’銀行振込’から選択できる

・お届け先を選択

・確認画面で、支払方法,お届け先,送料を含めた金額が表示される

### 8.マイページ

・顧客の登録情報が閲覧できる

・’編集する’ボタンで顧客の登録情報が変更できる

・注文履歴の一覧が表示できる

### 9.退会機能

・退会手続きができる

・顧客が、退会するを選択した際、間違いがないかもう一度選択画面が表示される

## ・管理者側

### 1.ログイン機能

・メールアドレスとパスワードでログインできる

### 2.ログアウト機能

・ログイン時のみ使える機能が利用できなくなる

### 3.商品一覧画面

・全商品の一覧が閲覧できる

・商品名をクリックすると、商品詳細画面に移る

・+ボタンで商品新規登録画面に移る

### 4.商品新規登録画面

・商品の’画像’,’商品名’,’説明’,’ジャンル’,’価格’,’販売ステータス（販売中／販売停止中）’が登録できる

### 5.商品編集画面

・商品新規登録画面で登録した情報を編集できる

### 6.ジャンル機能

・ジャンル一覧画面で、ジャンルの追加,編集ができる

・追加されたジャンルは、商品新規登録画面でジャンル選択時に選べるようになる

### 7.会員一覧画面

・会員ID,氏名,メールアドレス,ステータス（有効／退会）が閲覧できる

・氏名をクリックすると、会員詳細画面に移る

### 8.会員詳細画面／会員編集画面

・名前（漢字、フリガナ）,メールアドレス,郵便番号,住所,電話番号,ステータス（有効／退会）が表示される

・’編集する’ボタンで、会員の情報を編集可
　　（会員ステータスを退会にした場合、その顧客はログインできなくなる。）

### 9.注文履歴画面

・注文履歴一覧画面で、’購入日時’,’購入者’,’注文個数’,’注文ステータス’が閲覧できる

・’購入日時’をクリックすると、注文履歴詳細画面に移る


## 環境

* Ruby version 3.1.2

* Rails version 6.1.7 

* SQlite3 1.4

* Gems

・Bootstrap

・kaminari

*IDE Cloud9

