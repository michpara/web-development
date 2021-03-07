class User < ApplicationRecord
	validates :password, presence: true
	validates :username, :email, presence: true, uniqueness: true

	has_many :posts
	has_many :comments
end
