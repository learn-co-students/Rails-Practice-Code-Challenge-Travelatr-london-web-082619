class Blogger < ApplicationRecord
    has_many :posts, dependent: :destroy
    has_many :destinations, through: :posts

    validates :name, :bio, :age, presence: true
    validates :name, uniqueness: :true
    validates :age, numericality: { greater_than: 0}
    validates :bio, length: { minimum: 30}
end
