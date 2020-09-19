# README




# テーブル設計

## users テーブル
| Column             | Type    | Option      |
| ------------------ | ------- | ----------- |
| last_name          | string  | null: false |
| first_name         | string  | null: false |
| last_name_kana     | string  | null: false |
| first_name_kana    | string  | null: false |
| nickname           | string  | null: false |
| email              | string  | null: false |
| password           | string  | null: false |
| birthday           | date    | null: false |
| admin              | boolean | null: false |

### Association

-has_many :days, through: user_days
-has_many :user_days

## days テーブル
| Column          | Type       | Option         |
| --------------- | ---------- | -------------- |
| month           | date       | null: false    |
| date            | date       | null: false    |

### Association

-has_many :users, through: user_days
-has_many :user_days
-has_many :shifts


## user_days テーブル
| Column          | Type       | Option                         |
| --------------- | ---------- | ------------------------------ |
| day_id          | references | null: false, foreign_key: true | 
| user_id         | references | null: false, foreign_key: true | 

### Association

-belongs_to :user
-belongs_to :day


## shifts テーブル
| Column        | Type       | Option                         |
| ------------- | ---------- | ------------------------------ |
| start_time    | time       | null: false                    |
| end_time      | time       | null: false                    |
| break_start   | time       |                                |
| break_end     | time       |                                |
| day_id        | references | null: false, foreign_key: true |

### Association

-belongs_to :day

