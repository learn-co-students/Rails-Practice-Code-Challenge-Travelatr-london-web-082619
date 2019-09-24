class Destination < ApplicationRecord
    has_many :posts 
    has_many :bloggers, through: :posts

    def most_recent_posts
        self.posts.sort_by{ |post| post.created_at }.reverse.first(5)
    end

    def most_likes
        self.posts.max_by{ |post| post.likes }
    end

    def average_blogger_age
        self.bloggers.uniq.sum{ |blogger| blogger.age } / self.bloggers.length
    end


end
