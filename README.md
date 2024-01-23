# Eco＿Eatsデータベース設計

# usersテーブル
|Column            |Type    |Options                      |
|------------------|--------|-----------------------------|
|email             |string  |null: false, unique: true    |
|encrypted_password|string  |null: false, default: ""     |
|nickname          |string  |null: false                  |
|age               |integer |null: false                  |
|gender            |string  |null: false                  |

has_many :meals

# mealsテーブル
|Column            |Type       |Options                        |
|------------------|-----------|-------------------------------|
|user              |references |foreign_key: true, null: false |
|name              |string     |null: false                    |
|description       |text       |null: false                    |
|meal_time         |date       |null: false                    |

belongs_to :user
has_many :meal_items

# fooditemsテーブル
|Column            |Type    |Options                        |
|------------------|--------|-------------------------------|
|name              |string  |null: false                    |
|co2_emission      |float   |                               |
|nutritional_value |json    |                               |

has_many :meal_items

# mealitemsテーブル
|Column            |Type       |Options                        |
|------------------|-----------|-------------------------------|
|meal_id           |references |foreign_key: true, null: false |
|food_item_id      |references |foreign_key: true, null: false |
|quantity          |float      |                               |

belongs_to :meal
belongs_to :food_item
