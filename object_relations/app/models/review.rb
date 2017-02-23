class Review
  attr_accessor :review, :customer, :restaurant
  @@all=[]

  def initialize(review)
    @review = review
    @@all<<self
  end

  def self.all
    @@all
  end

end
