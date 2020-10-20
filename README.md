# テーブル設計

## users テーブル

| Column            | Type     | Options     |
| ----------------- | -------- | ----------- |
| family_name       | string   | null: false |
| first_name        | string   | null: false |
| family_name_kana  | string   | null: false |
| first_name_kane   | string   | null: false |
| nickname          | string   | null: false |
| email             | string   | null: false |
| password          | string   | null: false |
| birthday          | date     | null: false |

### Association

- has_many :items
- hsa_many :orders


## items テーブル

| Column                      | Type    | Options     |
| --------------------------- | ------- | ----------- |
| name                        | string  | null: false |
| price                       | integer | null: false |
| description                 | text    | null: false |
| category_id                 | integer | null: false |
| status_id                   | integer | null: false |
| shipping_charges_id         | integer | null: false |
| shipping_area_id            | integer | null: false |
| estimated_shipping_date_id  | integer | null: false |


### Association

- belongs_to :user
- has_one :oder

## orders テーブル

| Column      | Type        | Options                         |
| ----------- | ----------- | ------------------------------- |
| item        | references  | null: false,  foreign_key: true |
| user        | references  | null: false,  foreign_key: true |

### Association

- has_one :address
- belongs_to :item
- belongs_to :user

## address テーブル

| Column          | Type        | Options                         |
| --------------- | ----------- | ------------------------------- |
| postal_number   | string      | null: false                     |
| prefecture_id   | integer     | null: false                     |
| city            | string      | null: false                     |
| house_number    | string      | null: false                     |
| building_number | string      |                                 |
| phone_number    | string      | null: false                     |
| user            | references  | null: false,  foreign_key: true |

### Association

- belongs_to :oder
