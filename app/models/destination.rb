class Destination < ApplicationRecord
    has_many :posts
    has_many :bloggers, through: :posts

    def most_recent_posts
      posts.sort_by{ |post| post.id }.first(5)
    end

    def featured_post
      posts.max_by{ |post| post.likes }
    end

    def average_age
      posts.sum{ |post| post.blogger.age } / posts.length
    end

end