# テーブル設計

## users テーブル

| Column           | Type    | Options     |
| ---------------- | ------- | ----------- |
| nickname         | string  | null: false |
| mail             | string  | null: false |
| password         | string  | null: false |
| family_name      | string  | null: false |
| first_name       | string  | null: false |
| family_name_kana | string  | null: false |
| first_name_kana  | string  | null: false |
| birth_year       | integer | null: false |
| birth_month      | integer | null: false |
| birth_day        | integer | null: false |

### Association

- has_many :items
- has_many :comments
- has_many :item_purchase

## items テーブル

| Column        | Type       | Options                  |
| ------------- | ---------- | ------------------------ |
| item_name     | string     | null: false              |
| image         | string     | null: false              |
| description   | text       | null: false              |
| genre_id      | integer    | null: false              |
| condition_id  | integer    | null: false              |
| deli_fee_id   | integer    | null: false              |
| prefecture_id | integer    | null: false              |
| deli_date_id  | integer    | null: false              |
| user          | references | null: false, foreign_key: true |

### Association

- has_many   :comments
- belongs_to :user
- belongs_to_active_hash :genre_id
- belongs_to_active_hash :condition_id
- belongs_to_active_hash :deli_fee_id
- belongs_to_active_hash :prefecture_id
- belongs_to_active_hash :deli_date_id
- has_one :item_purchase


## comments テーブル

| Column  | Type       | Options                        |
| ------- | ---------- | -------------------------------|
| comment | text       | null: false                    |
| user    | references | null: false, foreign_key: true |
| item    | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :item

## item_purchases テーブル

| Column  | Type       | Options                        |
| ------- | ---------- | -------------------------------|
| user    | references | null: false, foreign_key: true |
| item    | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :item
- has_one :address


## addresses テーブル

| Column        | Type    | Options                    |
| ------------- | ------- | -------------------------- |
| postal_code   | integer | null: false                |
| prefecture_id | integer | null: false                |
| city          | string  | null: false                |
| house_number  | string  | null: false                |
| building_name | string  |                            |
| phone_number  | integer | null: false                |
| item_purchase | references | null: false, foreign_key: true |


### Association

- belongs_to :item_purchase 
- belongs_to_active_hash :prefecture_id

