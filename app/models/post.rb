class Post < ApplicationRecord
    #validate if title. description is empty
    validates :title, presence: true, length: { minimum: 6, maximum: 100 }
    validates :body, presence: true, length: { minimum: 10, maximum: 1000 }
    belongs_to :user
end
