# テーブル設計

## usersテーブル

| Column             | TYpe   | Options                  |
| ------------------ | ------ | ------------------------ |
| nickname           | string | null: false              |
| email              | string | null: false ,unique: true|
| encrypted_password | string | null: false              |
| last_name_chn      | string | null: false              |
| first_name_chn     | string | null: false              |
| last_name_kana     | string | null: false              |
| first_name_kana    | string | null: false              |
| birthday           | date   | null: false              |

### Associations
  -has_many :items 
  -has_many :purchases

## itemsテーブル

| Column             | TYpe       | Options                        |
| ------------------ | ---------- | ------------------------------ |
| name               | string     | null: false                    |
| text               | text       | null: false                    |
| category_id        | integer    | null: false                    |
| status_id          | integer    | null: false                    |
| shipping_id        | integer    | null: false                    |
| shipment_source_id | integer    | null: false                    |
| day_of_shipment_id | integer    | null: false                    |
| price              | integer    | null: false                    |
| user               | references | null: false, foreign_key: true |

### Associations
  -belongs_to :user
  -has_one :purchase 

## Ordersテーブル

| Column | TYpe       | Options                        |
| ------ | ---------- | ------------------------------ |
| user   | references | null: false, foreign_key: true |
| item   | references | null: false, foreign_key: true |

### Associations
  -belongs_to :user
  -belongs_to :item
  -has_one :addresses


## Addressesテーブル

| Column             | TYpe       | Options                        |
| ------------------ | ---------- | ------------------------------ |
| postal_code        | string     | null: false                    |
| shipment_source_id | integer    | null: false                    |
| city               | string     | null: false                    |
| address            | string     | null: false                    |
| building_name      | string     |                                |
| phone_number       | string     | null: false                    |
| order              | references | null: false, foreign_key: true |

### Associations
  -belongs_to :order