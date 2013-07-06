class User < ActiveRecord::Base
  devise :database_authenticatable, :trackable, :validatable, :recoverable
  attr_accessible :nome, :email, :password, :password_confirmation, :remember_me
  has_many :impulsos
end
