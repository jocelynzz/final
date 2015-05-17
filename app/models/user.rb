class User < ActiveRecord::Base

  has_many :comments
  validates :email, :uniqueness => true, :allow_nil => false
  validates :password, :presence => true
	
end
