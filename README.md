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
| birthday        | date       | null: false                    |

### Association

- has_many :items
- has_many :orders

## ordersテーブル

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
| building          | string     |                                |
| block             | string     | null: false                    |
| city              | string     | null: false                    |
| phone_number      | string     | null: false                    |
| order             | references | null: false,foreign_key: true  |

### Association

- belongs_to :order


## itemsテーブル

| Column            | Type       | Options                        |
| ------------------| ---------- | ------------------------------ |
| name              | string     | null: false                    |
| comment           | string     | null: false                    |
| category_id       | integer    | null: false                    |
| status_id         | integer    | null: false                    |
| shipping_at_id    | integer    | null: false                    |
| shipping_area_id  | integer    | null: false                    |
| shipping_date_id  | integer    | null: false                    |
| price             | integer    | null: false                    |
| image             |            | active storage(GEM)            |
| user              | references | null: false,foreign_key: true  |

### Association

- belongs_to :user
- has_one :order