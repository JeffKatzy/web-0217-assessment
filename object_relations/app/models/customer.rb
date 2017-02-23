require 'byebug'
require_relative './restaurant.rb'
require_relative './review.rb'
class Customer
  attr_accessor :name, :reviews, :restaurants
  @@all=[]

  def initialize(name)
    @name = name
    @reviews=[]
    @restaurants=[]
    @@all << self
  end

  def self.all
    @@all
  end

  def self.find_by_name(name)
    this = self.all.each.find{|customer| customer=name}
  end

  def add_review(review, restaurant)
    rev = Review.new(review: review, customer: self,restaurant: restaurant)
    @reviews << rev
    @restaurants << restaurant
    restaurant.reviews << rev
    restaurant.customers << self
  end

end

bob = Customer.new("bob")
cucina = Restaurant.new("Cucina")
bob.add_review("I hate this place", cucina)

# Customer.new('bob')
  # <>
# customer = customer.add_review('it was good', Restaurant.new)
  # result: a new review tied ot the restaurant, and tied to the customer
