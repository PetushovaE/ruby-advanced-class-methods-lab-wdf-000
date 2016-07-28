class Song

  attr_accessor :name, :artist_name

  @@all = []

  def initialize(name)
  	@name = name
    @@all << self
  end

  def self.create
     song = Song.new(name)
     @@all << song
     song
  end

  def self.find_by_name(name)
    @@all.detect {|song| song.name == name}
  end

  def self.find_or_create_by_name(name)
    if self.find_by_name(name)
       self.find_by_name(name)
     else
      self.create_by_name(name)
    end
  end

  def self.alphabetical
    @@all.sort_by{|song| song.name}
  end

  def self.new_by_name(name)
     song = Song.new(name)
     
    
  end

  def self.create_by_name(name)
    Song.new(name)
  end

  def self.all
    @@all
  end

  def save
    @@all << self
  end

  def self.new_from_filename(filename)
     list = filename.split(" - ")
     song =  self.create_by_name(list[1].split(".")[0])
     song.artist_name = list[0]
     song
  end

  def self.create_from_filename(filename)
    self.all << self.new_from_filename(filename)
  end

  def self.destroy_all
    @@all.clear
  end
end
