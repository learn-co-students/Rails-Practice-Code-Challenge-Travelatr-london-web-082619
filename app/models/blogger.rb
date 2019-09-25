class Blogger < ApplicationRecord
    has_many :posts, dependent: :destroy
    has_many :destinations, through: :posts

    validates :name, :age, presence: true
    validates :name, uniqueness: true
    validates :bio, length: {minimum: 30}

end
