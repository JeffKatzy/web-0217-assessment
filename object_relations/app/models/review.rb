class Review
  attr_accessor :review, :customer, :restaurant
  @@all=[]

  def initialize(review:,customer:,restaurant:)
    @review = review
    @customer = customer
    @restaurant = restaurant
    @@all<<self
  end

  def self.all
    @@all
  end

end
