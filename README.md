# テーブル設計

## users テーブル

| Column            | Type   | Options     |
| ----------------- | ------ | ----------- |
| family_name       | string | null: false |
| first_name        | string | null: false |
| family_name_kana  | string | null: false |
| first_name_kane   | string | null: false |
| nickname          | string | null: false |
| email             | string | null: false |
| password          | string | null: false |
| bd_year           | date   | null: false |
| bd_month          | date   | null: false |
| bd_day            | date   | null: false |

### Association

- has_many :items
- has_one :order


## items テーブル

| Column                   | Type    | Options     |
| ------------------------ | ------- | ----------- |
| name                     | string  | null: false |
| category                 | string  | null: false |
| price                    | integer | null: false |
| seller                   | string  | null: false |
| description              | text    | null: false |
| status                   | string  | null: false |
| shipping_charges         | string  | null: false |
| shipping_area            | string  | null: false |
| estimated_shipping_date  | string  | null: false |


### Association

- belongs_to :user
- belongs_to :oder

## orders テーブル

| Column      | Type        | Options                        |
| ----------- | ----------- | ------------------------------ |
| price       | references  |null: false,  foreign_key: true |
| number      | integer     | null: false                    |
| exp_month   | date        | null: false                    |
| exp_year    | date        | null: false                    |
| user        | references  |null: false,  foreign_key: true |

### Association

- has_one :address
- has_one :item
- belongs_to :user

## address テーブル

| Column        | Type        | Options                        |
| ------------- | ----------- | ------------------------------ |
| postal_number | string      | null: false                    |
| prefecture    | integer     | null: false                    |
| city          | string      | null: false                    |
| house_number  | integer     | null: false                    |
| phone_number  | integer     | null: false                    |
| user          | references  |null: false,  foreign_key: true |

### Association

- belongs_to :address
- belongs_to :user