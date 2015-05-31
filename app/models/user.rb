class User < ActiveRecord::Base

  has_many :comments, :dependent => :delete_all
  has_many :posts, :dependent => :delete_all
  has_many :active_relations, :class_name => "Relation",
                              :foreign_key=> "follower_id",
                              :dependent => :destroy
  has_many :passive_relations, :class_name => "Relation",
           :foreign_key=> "followed_id",
           :dependent => :destroy

  has_many :followings, :through  => :active_relations, :source => :followed
  has_many :followers, :through  => :passive_relations, :source => :follower

  has_secure_password
  
  validates :email, :uniqueness => true, :allow_nil => false
  validates :user_name, :uniqueness => true, :allow_nil => false
  validates :password, :presence => true, :allow_nil => false

  # Follows a user.
  def follow(other_user)
    active_relations.create(followed_id: other_user.id)
  end

  # Unfollows a user.
  def unfollow(other_user)
    active_relations.find_by(followed_id: other_user.id).destroy
  end

  # Returns true if the current user is following the other user
  def following?(other_user)
    followings.include?(other_user)
  end
	
end
