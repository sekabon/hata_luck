# HATA_LUCK(はたらっく)
## 簡単に予定の共有ができます
### 店舗型ビジネスで




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

