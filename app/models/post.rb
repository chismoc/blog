class Post < ApplicationRecord
    #validate if title. description is empty
    validates :title, presence: true, length: { minimum: 6, maximum: 100 }
    validates :body, presence: true
    belongs_to :user
    #if delete post delete all comments
    has_many :comments, dependent: :destroy
    has_rich_text :body
    has_one :content, class_name: 'ActionText::RichText', as: :record, dependent: :destroy

    has_noticed_notifications model_name: 'Notification'
    has_many :notifications, through: :user
end