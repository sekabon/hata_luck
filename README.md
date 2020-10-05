# README

# アプリ名
## HATA_LUCK(はたらっく)
 店舗型のビジネスで、予定の管理を効率化するアプリです。  　
 スタッフは予定の提出と確認。店長は来週と再来週の全員の予定の確認が簡単にできます。
 

## 制作背景
### [課題]
 飲食店などの店舗型のビジネスにおいて、スタッフの予定管理は非常に重要です。  スタッフの収入に直結するためで、予定に間違いがなく、なるべく希望に沿った額を稼ぐことができれば、モチベーションの向上につながります。  しかし、スタッフの予定提出方法は手書きメモ、メール、ラインなどと統一されてないことが多く、予定の管理は単純作業であるにも関わらず、大変手間がかかり、店長にとっては頭の痛い課題です。


## 本番環境 
 HEROKUにデプロイしています。  
 こちらからアクセスできます。  
 [hata_luck](https://hata-luck-28277.herokuapp.com/)

### <テストユーザーアカウント>
 メールアドレス： yama@gmail.com  
 パスワード： yamada01

### <管理者ユーザーアカウント>
 メールアドレス： admin@test.com  
 パスワード： admin01
 
### [使い方]
 スタッフは、①アプリを開き、②ログインし、③日付→勤務開始時間→勤務終了時間を設定し、④登録ボタンを押すだけで予定提出完了！

 店長は、①アプリを開き、②(管理者権限で)ログインし、③予定確認ボタンを押すだけで、来週月曜日〜二週間分の全員の予定が確認できます。

## 使用技術
・HTML
・CSS
・Ruby 2.6.5
・Ruby on Rails
・MySQL
・VSCode
・GitHub

# 課題や今後実装したい機能
 
### レスポンシブ対応
　特にスタッフはスマホで使用するため、必要だと思います。

### LINEとの連携
　スタッフの登録のし易さ、使いやすさのためです。

### 予定の確認をエクセル形式のファイルで確認
 予定確認画面でエクセル形式でパッと見で確認できるようにし、
 さらにそのまま編集して、閲覧や印刷可能にしたいと思います。
 
### ユーザーが使いたくなるUI/UX
 シンプルで、使いやすいデザインにしたいと思います。

### AWSにデプロイ
　一度挑戦してみたのですができなかったので、もう一度挑戦してみます。

# テーブル設計

## users テーブル
| Column             | Type    | Option      |
| ------------------ | ------- | ----------- |
| last_name          | string  | null: false |
| first_name         | string  | null: false |
| last_name_kana     | string  | null: false |
| first_name_kana    | string  | null: false |
| email              | string  | null: false |
| password           | string  | null: false |
| birthday           | date    | null: false |
| admin              | boolean | null: false |

### Association

-has_many :shifts

## shifts テーブル
| Column        | Type       | Option                         |
| ------------- | ---------- | ------------------------------ |
| work_day      | date       | null: false                    |
| start_time    | time       | null: false                    |
| end_time      | time       | null: false                    |
| break_start   | time       |                                |
| break_end     | time       |                                |
| user          | references | null: false, foreign_key: true |

### Association

-belongs_to :user

