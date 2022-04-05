class Post < ApplicationRecord
    has_many_attached :files 
    belongs_to :user
    geocoded_by :location
    validates :files, presence: true 
    validates :title, presence: true 
    validates :location, presence: true 
    validates :category, presence: true
    after_validation :geocode
end
