require_relative '../lib/deck.rb'

deck1 = Deck.new
puts deck1.deck

puts "====== New Deck ======="
deck2 = deck1.clone
puts deck2.deck

deck1.shuffle

puts "====== After shuffling ======"
puts deck1.deck
puts "===== New Deck ======"
puts deck2.deck

puts deck1.deck.object_id
puts deck2.deck.object_id


# class Person
#   attr_accessor :name
#   attr_reader :fave_foods

#   def initialize(name)
#     @name = name
#     @fave_foods = []
#   end

#   def add_fave_food(food)
#     @fave_foods << food
#   end
# end

# # Create a new person and add favorite foods
# person1 = Person.new("Bob")

# # Call .dup on person and change name
# person2 = person1.dup
# person2.name = "Paul"

# # Confirm that name change works
# puts person1.name  # Bob
# puts person2.name  # Paul

# # Add favorite food 
# person2.add_fave_food("pizza")

# # Notice that it adds to both person objects
# p person1.fave_foods  # ["pizza"]
# p person2.fave_foods  # ["pizza"]


# # This is similar to what happens when you call .dup on a nested array:
# colors1 = ["red", "yellow", ["light-blue", "dark-blue"]]
# colors2 = colors1.dup

# colors1[2][1] = "navy"

# p colors1  # ["red", "yellow", ["light-blue", "navy"]]
# p colors2  # ["red", "yellow", ["light-blue", "navy"]]

