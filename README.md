# テーブル設計

## users テーブル

| Column             | Type   | Options                     |
| ------------------ | ------ | --------------------------- |
| birthday           | date   | null: false                 |
| nickname           | string | null: false                 |
| first_name         | string | null: false                 |
| last_name          | string | null: false                 |
| first_name_sub     | string | null: false                 |
| last_name_sub      | string | null: false                 |
| email              | string | null: false, unique: true   |
| encrypted_password | string | null: false                 |

### Association

- has_many :items
- has_many :orders

## items テーブル

| Column             | Type       | Options                         |
| ------------------ | ---------- | ------------------------------- |
| name               | string     | null: false                     |
| content            | text       | null: false                     |
| price              | integer    | null: false                     |
| category_id        | integer    | null: false                     |
| condition_id       | integer    | null: false                     |
| area_id            | integer    | null: false                     |
| delivery_cost_id   | integer    | null: false                     |
| delivery_time_id   | integer    | null: false                     |
| user               | references | null: false, foreign_key: true  |

### Association

- belongs_to :user
- has_one :order

## orders テーブル

| Column | Type       | Options                        |
| ------ | ---------- | ------------------------------ |
| user   | references | null: false, foreign_key: true |
| item   | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :item
- has_one :address

## addresses テーブル

| Column        | Type       | Options                        |
| ------------- | ---------- | ------------------------------ |
| post_code     | string     | null: false                    |
| town          | string     | null: false                    |
| house_number  | string     | null: false                    |
| building      | string     |                                |
| phone_number  | string     | null: false                    |
| area_id       | integer    | null: false                    |
| order         | references | null: false, foreign_key: true |

### Association

- belongs_to :order