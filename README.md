# テーブル設計

## users テーブル

| Column             | Type   | Options     |
| ------------------ | ------ | ----------- |
| name               | string | null: false |
| email              | string | null: false,unique:true|
| encrypted_password | string | null: false |
| birth_date         | date   | null: false |
| family_name        | string | null: false |
| first_name         | string | null: false |
| ruby_family_name   | string | null: false |
| ruby_first_name    | string | null: false |

### Association

- has_many :items
- has_many :purchases

## items テーブル

| Column                 | Type   | Options     |
| ------------------     | ------ | ----------- |
| title                  | string | null: false |
| description            | text   | null: false |
| category_id            | integer | null: false |
| condition_id           | integer | null: false |
| delivery_charge_id     | integer | null: false |
| shipping_date_id       | integer | null: false |
| area_id                | integer | null: false |
| price                  | integer    | null: false |
| user                   | references | null: false,foreign_key: true|

### Association
belongs_to: user
has_one: purchase


## purchases テーブル
| Column             | Type   | Options     |
| ------------------ | ------ | ----------- |
| item           | references  | null: false,foreign_key: true|
| user           | references  | null: false,foreign_key: true|

### Association
belongs_to :user
belongs_to :item
has_one :address


## addresses テーブル

| Column             | Type   | Options     |
| ------------------ | ------ | ----------- |
| post_number        | string  | null: false |
| prefecture         | integer | null: false |
| city               | string  | null: false |
| number             | string  | null, false |
| building           | string  |foreign_key: true|
| phone_number       | string  | null: false |
| user               | references  | null: false,foreign_key: true|

### Association
belongs_to: purchase