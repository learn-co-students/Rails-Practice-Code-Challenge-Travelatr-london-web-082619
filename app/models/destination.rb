class Destination < ApplicationRecord
  has_many :posts
  has_many :bloggers, through: :posts

  def x_most_recent_posts(x)
    posts_by_created_at_desc = self.posts.sort_by { |post| post.created_at }.reverse
    
    if posts_by_created_at_desc.length > x
      posts_by_created_at_desc.slice(0...x)
    else
      posts_by_created_at_desc
    end
  end

  def most_liked_post
    self.posts.max_by { |post| post.likes }
  end

  def avg_blogger_age
    total_age = self.bloggers.uniq.reduce(0) do |memo, blogger|
      memo + blogger.age
    end
    total_age / self.bloggers.uniq.count
  end

end
