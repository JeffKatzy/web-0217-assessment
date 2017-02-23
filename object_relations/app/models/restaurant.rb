class Restaurant
  attr_accessor :name
  @@all = []
  CUSTOMERS=[]
  REVIEWS=[]

  def initialize(name)
    @name=name
    @@all<<self
  end

  def self.all
    @@all
  end

  def self.find_by_name(name)
    this = self.all.each.find{|restaurant| restaurant=name}
  end

  def reviews
    REVIEWS
  end

  def customers
    CUSTOMERS
  end

end
