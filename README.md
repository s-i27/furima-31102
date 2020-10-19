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
| last_name       | string     | null: false                    |
| first_name      | string     | null: false                    |
| last_name_kana  | string     | null: false                    |
| first_name_kana | string     | null: false                    |
| birthday        | datetime   | null: false                    |

### Association

- has_many :items
- has_many :buys

## buysテーブル

| Column            | Type       | Options                        |
| ------------------| ---------- | ------------------------------ |
| user              | references | null: false,foreign_key: true  |
| item              | references | null: false,foreign_key: true  |

### Association

- belongs_to ：user
- has_one :addres
- belongs_to :item


## addressテーブル

| Column            | Type       | Options                        |
| ------------------| ---------- | ------------------------------ |
| postcode          | string     | null: false                    |
| prefecture_id     | integer    | null: false                    |
| building          | string     | null: false                    |
| block             | string     | null: false                    |
| city              | string     | null: false                    |
| phone_number      | string     | null: false                    |
| buys              | references | null: false,foreign_key: true  |

### Association

- has_many :buys


## itemsテーブル

| Column            | Type       | Options                        |
| ------------------| ---------- | ------------------------------ |
| name              | string     | null: false                    |
| comment           | string     | null: false                    |
| category          | integer    | null: false                    |
| status            | integer    | null: false                    |
| ship_charge_at    | integer    | null: false                    |
| ship_form_area    | integer    | null: false                    |
| ship_form_date    | integer    | null: false                    |
| price             | integer    | null: false                    |
| image             |            | active storage(GEM)            |
| user              | references | null: false,foreign_key: true  |

### Association

- belongs_to :user
- has_one :buy