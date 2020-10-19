# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...

# テーブル設計

## usersテーブル

| Column          | Type       | Options                        |
| ----------------| ---------- | ------------------------------ |
| email           | string     | null: false,unique: true       |
| password        | string     | null: false                    |
| nickname        | string     | null: false,unique: true       |
| last_name       | text       | null: false                    |
| first_name      | text       | null: false                    |
| last_name_kana  | text       | null: false                    |
| first_name_kana | text       | null: false                    |
| birthday_year   | integer    | null: false                    |
| birthday_month  | integer    | null: false                    |
| birthday_date   | integer    | null: false                    |
| buys            | references | foreign_key: true              |

### Association

- has_many :items
- has_many :buys, through: buy_users


## buy_users テーブル

| Column | Type       | Options                        |
| ------ | ---------- | ------------------------------ |
| buy    | references | null: false, foreign_key: true |
| user   | references | null: false, foreign_key: true |

### Association

- belongs_to :buy
- belongs_to :user


## buysテーブル

| Column            | Type       | Options                        |
| ------------------| ---------- | ------------------------------ |
| user              | references | null: false,foreign_key: true  |
| item              | references | null: false,foreign_key: true  |

### Association

- has_many :users, through: buy_users
- belongs_to :addres
- belongs_to :item


## addressテーブル

| Column            | Type       | Options                        |
| ------------------| ---------- | ------------------------------ |
| postcode          | text       | null: false                    |
| prefecture_id     | text       | null: false                    |
| building          | text       | null: false                    |
| block             | text       | null: false                    |
| city              | text       | null: false                    |
| phone_number      | integer    | null: false                    |
| buys              | references | null: false,foreign_key: true  |

### Association

- has_many :buys


## itemsテーブル

| Column            | Type       | Options                        |
| ------------------| ---------- | ------------------------------ |
| name              | text       | null: false                    |
| comment           | string     | null: false                    |
| category          | text       | null: false                    |
| status            | text       | null: false                    |
| ship_charge_at    | text       | null: false                    |
| ship_form_area    | text       | null: false                    |
| ship_form_date    | text       | null: false                    |
| price             | integer    | null: false                    |
| image             |            | active storage(GEM)            |
| user              | references | null: false,foreign_key: true  |

### Association

- belongs_to :user
- has_one :buy