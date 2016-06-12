class Owner
  attr_accessor :pets, :name
  attr_reader :species
  @@all = []
  @@count = 0

  def initialize(species)
    @pets = {fishes: [], cats: [], dogs: []}
    @species = species
    # @name = name
    @@all << self
    @@count += 1
  end

  def self.all
    @@all
  end

  def self.reset_all
    @@all.clear
    @@count = 0
  end

  def self.count
    @@count
  end

  def say_species
    "I am a #{@species}."
  end

  def buy_fish(fish)
    new_fish = Fish.new(fish)
    @pets[:fishes] << new_fish
  end

  def buy_cat(cat)
    new_cat = Cat.new(cat)
    @pets[:cats] << new_cat
  end

  def buy_dog(dog)
    new_dog = Dog.new(dog)
    @pets[:dogs] << new_dog
  end

  def walk_dogs
      @pets[:dogs].each { |dog| dog.mood = "happy" }
      # Why didn't the equals operator work?
  end

  def play_with_cats
    @pets[:cats].each { |cat| cat.mood = "happy" }
  end

  def feed_fish
    @pets[:fishes].each { |fish| fish.mood = "happy"}
  end

# The test for this one is in the wrong order.
# How can the pets in the array be set to nervous if they're already sold.
  def sell_pets
    @pets.each do |type, names|
      names.each do |pet|
        pet.mood = "nervous"
      end
    end
    @pets.map do |type, names|
      names.clear
    end
  end

  def list_pets
    "I have #{@pets[:fishes].size} fish, #{@pets[:dogs].size} dog(s), and #{@pets[:cats].size} cat(s)."
  end

end
