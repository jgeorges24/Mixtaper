class User < ApplicationRecord

has_secure_password

has_many :mixtapes
has_many :created_mixtapes, foreign_key: "user_id", class_name: "Mixtape"
has_many :opinions, through: :mixtapes

#user validations
validates :username, presence: true, uniqueness: true
validates :password, presence: true, length: { in: 5..30}






end
