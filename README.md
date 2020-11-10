# テーブル設計

## userテーブル

| Column             | TYpe   | Options     |
| ------------------ | ------ | ----------- |
| nickname           | string | null: false |
| email              | string | null: false |
| encrypted_password | string | null: false |
| last_name_chn      | string | null: false |
| first_name_chn     | string | null: false |
| last_name_kana     | string | null: false |
| first_name_kana    | string | null: false |
| birthday           | date   | null: false |

### Association
  -has_many :items dependent::destroy
  -has_many :purchases

## itemテーブル

| Column             | TYpe       | Options                        |
| ------------------ | ---------- | ------------------------------ |
| name               | string     | null: false                    |
| text               | string     | null: false                    |
| category_id        | integer    | null: false                    |
| status_id          | integer    | null: false                    |
| shipping_id        | integer    | null: false                    |
| shipment_source_id | integer    | null: false                    |
| day_of_shipment_id | integer    | null: false                    |
| price              | integer    | null: false                    |
| user           | references | null: false, foreign_key: true |

### Association
  -belongs_to :user
  -has_one :purchase 

## Purchaseテーブル

| Column        | TYpe       | Options                        |
| ------------- | ---------- | ------------------------------ |
| postal_code   | string     | null: false                    |
| prefecture_id | integer    | null: false                    |
| city          | string     | null: false                    |
| address       | string     | null: false                    |
| building_name | string     |                                |
| phone_number  | string     | null: false                    |
| user          | references | null: false, foreign_key: true |
| item          | references | null: false, foreign_key: true |

### Association
  -belongs_to :user
  -belongs_to :item
