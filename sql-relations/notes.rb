# Ok, now we have a totally different website then in object relations section.
# Please don't base your answers on your ruby work.

# Consider how a yelp site is organized
# We need customers, restaurants, owners, and reviews.  How do they link up?

# 1. As a first step
# Please write out the domain model on this file
# What we are concerned about is which tables have foreign keys
# Don't stress: There may be multiple correct answers based on your conception of the problem.

# Eg. for our books and authors your deliverable would look like

# books
id | title | author_id

# author
id | name |

# Hints:
# - The data always lives on the belongs to relationship
# - Do the belongs_to first
# - Then do the has_many
# - If there is a many to many, we need a third table

# Write your answer here.

CUSTOMERS
has many reviews
has many restaurants through reviews
id | name

RESTAURANTS
has many reviews
has many customers through reviews
has many owners through owner-restaurants
id | name

OWNER_RESTAURANT
belongs to owner
belongs to restaurant
id | restaurant_id | owner_id

OWNERS
has many restaurants through owner-restaurants
id | name

REVIEWS
belongs to customer
belongs to restaurant
id | review | customer_id | restaurant_id

(turns out database used in methods does not have multiple owners per restaurant,
so the sequel used in the methods is different than
what I wrote out below)

# 2. As a second step, please fill in the stubbed out methods in the respective model.
# Customer#reviews
"SELECT * FROM reviews INNER JOIN customers
ON reviews.customer_id = customers.id
WHERE customers.name = ?"

# Owner#restaurants
"SELECT * FROM owners INNER JOIN owner_restaurant
ON owner.id = owner_restaurant.owner_id INNER JOIN restaurants
ON owner_restaurant.restaurant_id = restaurant.id
WHERE owner.name = ?"

# Restaurant#owner
"SELECT owner_name FROM restaurant INNER JOIN owner_restaurant
ON restaurant.id = owner_restaurant.restaurant_id INNER JOIN owner
ON owner_restaurant.owner_id = owner.id
WHERE restaurant.name = ?"

# Review#customer
"SELECT customer.name FROM review INNER JOIN customer
ON review.customer_id = customer.id
WHERE review.id = ?"

# Review#restaurant
"SELECT restaurant.name FROM review INNER JOIN restaurant
SELECT restaurants.*
ON review.restaurant_id = restaurant.id
WHERE review.id=?"
