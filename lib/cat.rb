class Cat
  # code goes here
  attr_reader :name
  attr_accessor :owner, :mood
  @@all = []
  
  def initialize(name, owner, mood = "nervous")
    @name = name
    @owner = owner
    @mood = mood
    save 
  end

  def self.all 
    @@all 
  end

  def save
    @@all << self 
  end
end
