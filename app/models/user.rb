class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  #delete posts and comments when user is delete     
         has_many :posts, dependent: :destroy
         has_many :comments, dependent: :destroy
end
