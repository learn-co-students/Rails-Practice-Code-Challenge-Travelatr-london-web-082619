class Destination < ApplicationRecord
    has_many :posts
    has_many :bloggers, through: :posts

    def most_recent
        posts_ordered = self.posts.sort_by {|p| p.created_at}
        posts_ordered.reverse.first(2)
    end

    def most_likes
        self.posts.max_by{|p| p.likes}
    end

    def average_age
        blogger = self.bloggers.uniq
        ages = blogger.map do |b| b.age end
        ages.sum / ages.length
    end

end
