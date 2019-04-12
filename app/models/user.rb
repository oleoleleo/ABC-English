class User < ApplicationRecord
  validates :name, presence: true, length: (1..40)
  validates :email, presence: true, format: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i

  has_secure_password
    validates :password, length: (8..32), presence: true, format: /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i

  has_many :topics
end
