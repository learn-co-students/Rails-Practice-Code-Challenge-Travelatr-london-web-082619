class Destination < ApplicationRecord
    has_many :posts
    has_many :bloggers, through: :posts

    validates :name, uniqueness: true

    def bloggers_average_age
        (self.bloggers.sum(&:age).to_f / self.bloggers.length).round(0)
    end

    def of_posts(blogger)
        self.posts.select{|post| post.blogger_id == blogger.id}
    end
end
