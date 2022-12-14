class Show < ActiveRecord::Base
  def self.highest_rating
    maximum(:rating)
  end

  def self.most_popular_show
    # Show.where('rating = ?', highest_rating)
    most_popular = highest_rating
    where(rating: most_popular).first
  end

  def self.lowest_rating
    minimum(:rating)
  end

  def self.least_popular_show
    least_popular = lowest_rating
    where(rating: least_popular).first
  end

  def self.ratings_sum
    sum(:rating)
  end

  def self.popular_shows
    where('rating > 5')
  end

  def self.shows_by_alphabetical_order
    order(:name)
  end
end
