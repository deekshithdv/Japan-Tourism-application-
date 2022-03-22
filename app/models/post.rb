class Post < ApplicationRecord
    has_many_attached :files 
    belongs_to :user
    validates :files, presence: true 
    validates :title, presence: true 
    validates :location, presence: true 
end
