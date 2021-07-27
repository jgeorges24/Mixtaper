class User < ApplicationRecord

has_secure_password

#gives me user.mixtapes 
has_many :mixtapes

#gives me the created mixtapes by user
has_many :created_mixtapes, foreign_key: "user_id", class_name: "Mixtape"

#gives me user.opinions for the list of opinions user made on mixtapes
has_many :opinions, through: :mixtapes

#user validations
validates :username, presence: true, uniqueness: true
validates :password, presence: true, length: { in: 5..30}


end
