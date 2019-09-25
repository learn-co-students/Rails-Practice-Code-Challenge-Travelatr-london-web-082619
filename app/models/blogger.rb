
class Blogger < ApplicationRecord

    has_many :posts
    has_many destinations, through: :posts

    validates :name, uniqueness: true
    validates :age, length:{minimum: 0}
    validates :bio, length:{minimum:30}


    def self.total_likes

      post = Post.each{|post| post.blogger_id = self}
        
    end

    def most_liked

        post

    end

end
