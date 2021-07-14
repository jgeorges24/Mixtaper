class User < ApplicationRecord

has_secure_password

has_many :tapes
has_many :created_mixtapes, foreign_key: "user_id", class_name: "Mixtape"

#user validations
validates :username, presence: true, uniqueness: true
validates :password, presence: true, length: { in: 5..30}






end
