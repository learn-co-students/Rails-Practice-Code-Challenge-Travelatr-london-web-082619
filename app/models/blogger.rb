class Blogger < ApplicationRecord
  has_many :posts
  has_many :destinations, through: :posts

  validates :name, presence: true, uniqueness: true
  validates :age, numericality: { greater_than: 0 }
  validates :bio, length: { minimum: 30 }

  def total_likes
    self.posts.reduce(0) { |memo, post| memo + post.likes }
  end

  def most_liked_post
    self.posts.max_by { |post| post.likes }
  end

  def top_x_destinations(x)
    destinations = destinations_by_post_count   
    destinations.length > x ? destinations.slice(0...x) : destinations
  end

  private

  def destinations_by_post_count
    #Return a list of unique destinations, sorted by their post count DESC
    destinations_by_posts_asc = self.destinations.uniq.sort_by do |destination|
      destination.posts.length
    end

    destinations_by_posts_asc.reverse
  end

end
