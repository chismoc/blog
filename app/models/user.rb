class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  #delete posts and comments when user is delete     
         has_many :posts, dependent: :destroy
         has_many :comments, dependent: :destroy
         has_many :notifications, as: :recipient, dependent: :destroy

         enum role: [:user, :admin]
       after_initialize :set_default_role, if: :new_record?

def full_name
  "#{first_name.capitalize} #{last_name.capitalize}"
end
   private
   def set_default_role
       self.role ||= :user
   end    

end
