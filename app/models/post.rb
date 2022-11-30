class Post < ApplicationRecord
    #validate if title. description is empty
    validates :title, presence: true, length: { minimum: 6, maximum: 100 }
    validates :body, presence: true, length: { minimum: 10, maximum: 1000 }
    belongs_to :user
    #if delete post delete all comments
    has_many :comments, dependent: :destroy

    has_noticed_notifications model_name: 'Notification'
    has_many :notifications, through: :user, dependent: :destroy
end
