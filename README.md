# テーブル設計

## users テーブル

| Column             | Type   | Options     |
| ------------------ | ------ | ----------- |
| birthday           | string | null: false |
| nickname           | string | null: false |
| name               | string | null: false |
| name_sub           | string | null: false |
| mail               | string | null: false, unique: true |
| encrypted_password | string | null: false |

### Association

- has_many :items
- has_many :orders

## items テーブル

| Column | Type   | Options     |
| ------ | ------ | ----------- |
| image  | string | null: false |
| name   | string | null: false |
| content   | text | null: false |
| category   | string | null: false |
| condition   | string | null: false |
| price   | integer | null: false |
| delivery_cost   | string | null: false |
| delivery_area   | string | null: false |
| delivery_time   | string | null: false |
| user   | references | null: false, foreign_key: true |

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
| area          | string     | null: false                    |
| town          | string     | null: false                    |
| house_number  | string     | null: false                    |
| building      | string     |                                |
| phone_number  | integer    | null: false                    |
| order         | references | null: false, foreign_key: true |

### Association

- belongs_to :order