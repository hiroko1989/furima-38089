# テーブル設計

## users テーブル

| Column             | Type   | Options     |
| ------------------ | ------ | ----------- |
| name               | string | null: false |
| email              | string | null: false,unique:true|
| encrypted_password | string | null: false |
| birth_date         | string | null: false |
| family_name        | string | null: false |
| first_name         | string | null: false |
| ruby_family_name   | string | null: false |
| ruby_first_name    | string | null: false |

### Association

- has_many :items
- has_one :address
- has_one :payment

## items テーブル

| Column              | Type   | Options     |
| ------------------  | ------ | ----------- |
| title               | string | null: false |
| desscription        | text   | null: false |
| category            | string | null: false |
| condition           | string | null: false |
| delivery_charge     | string | null: false |
| shipping_date       | string | null: false |
| price               | integer    | null: false |
| user                | references | null: false,foreign_key: true|

### Association
belongs_to: user
has_one: address
has_one: payment


## payment テーブル

| Column             | Type   | Options     |
| ------------------ | ------ | ----------- |
| card_number        | integer | null: false |
| date_of_expire     | integer | null: false,unique:true|
| security_code      | integer | null: false |

### Association
belongs_to: user

## address テーブル

| Column             | Type   | Options     |
| ------------------ | ------ | ----------- |
| post_number        | integer | null: false |
| prefecters         | string | null: false,unique:true|
| municipality       |string  | null: false |
| number             | integer |null,false|
| building          | string | null: false |
| phpnnne_number     | string | null: false |

### Association
belongs_to: user