# テーブル設計

## userテーブル

| Column          | TYpe   | Options     |
| --------------- | ------ | ----------- |
| nickname        | string | null: false |
| email           | string | null: false |
| password        | string | null: false |
| last_name_chn   | string | null: false |
| first_name_chn  | string | null: false |
| last_name_kana  | string | null: false |
| first_name_kana | string | null: false |
| birthday        | date   | null: false |

### Association
  -has_many :items dependent::destroy
  -has_many :purchases

## itemテーブル

| Column          | TYpe       | Options                        |
| --------------- | ---------- | ------------------------------ |
| item_name       | string     | null: false                    |
| text            | string     | null: false                    |
| category        | string     | null: false                    |
| status          | string     | null: false                    |
| shipping        | string     | null: false                    |
| shipment_source | string     | null: false                    |
| day_of_shipment | string     | null: false                    |
| price           | integer    | null: false                    |
| user_id         | references | null: false, foreign_key: true |

### Association
  -belongs_to :user
  -has_one :purchase 

## Purchaseテーブル

| Column          | TYpe       | Options                        |
| --------------- | ---------- | ------------------------------ |
| card_number     | integer    | null: false                    |
| expiration      | date       | null: false                    |
| security_code   | integer    | null: false                    |
| postal_code     | integer    | null: false                    |
| prefecture      | string     | null: false                    |
| city            | string     | null: false                    |
| address         | string     | null: false                    |
| building_name   | string     | null: false                    |
| phone_number    | integer    | null: false                    |
| user_id         | references | null: false, foreign_key: true |
| item_id         | references | null: false, foreign_key: true |

### Association
  -belongs_to :user
  -belongs_to :item
