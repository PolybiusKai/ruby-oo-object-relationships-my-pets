class Owner
  # code goes here
  attr_reader :name, :species
    @@all = []
  def initialize(name)
    @name = name 
    @species = "human"
    save 
  end

  def say_species
    "I am a #{self.species}."
  end

  def save
    @@all << self 
  end

  def self.all
    @@all 
  end

  def self.count 
    self.all.count
  end

  def self.reset_all
    self.all.clear
  end

  def cats
    Cat.all.select {|cat| cat.owner == self}
  end

  def dogs
    Dog.all.select {|dog| dog.owner == self}
  end

  def buy_cat(name)
    Cat.new(name, self)
  end

  def buy_dog(name)
    Dog.new(name, self)
  end

  def walk_dogs
    Dog.all.each {|dog| dog.owner == self ? dog.mood = "happy": dog}
  end

  def feed_cats
    Cat.all.each {|cat| cat.owner == self ? cat.mood = "happy": cat}
  end

  def sell_pets
    pets = self.cats + self.dogs
    pets.each {|pet| 
      pet.mood = "nervous" 
      pet.owner = nil
    }
  end

  def list_pets
    "I have #{self.dogs.count} dog(s), and #{self.cats.count} cat(s)."
  end
end

