require 'byebug'
require_relative './restaurant.rb'
require_relative './review.rb'
class Customer
  attr_accessor :name
  @@all=[]
  @@reviews=[]

  def initialize(name)
    @name = name
    @@all << self
  end

  def self.all
    @@all
  end

  def self.find_by_name(name)
    this = self.all.each.find{|customer| customer=name}
  end

  def add_review(review, restaurant)
    rev = Review.new(review)
    rev.customer = self
    rev.restaurant = restaurant
    @@reviews << rev
    restaurant.reviews << rev
    restaurant.customers << self
  end

end

bob = Customer.new('bob')
rest1 = Restaurant.new('rest1')
bob.add_review("it was good", rest1)
bob.add_review("it was bad", Restaurant.new('rest2'))
# Customer.new('bob')
  # <>
# customer = customer.add_review('it was good', Restaurant.new)
  # result: a new review tied ot the restaurant, and tied to the customer
