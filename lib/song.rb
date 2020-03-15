require 'pry'
class Song
  attr_accessor :name, :artist_name
  @@all = []

  def self.create
    song = Song.new 
    @@all << song
    song

  end
  def self.new_by_name(new_song)
    song = Song.create
    @name = new_song
    song.name = @name 
    song


    
 end

def self.create_by_name(name)
  song = Song.new_by_name(name)
   Song.all.find do |create| 
    create.name == name
end 
 
  end

  def self.find_by_name(name)
    Song.all.find do |create| 
      create.name == name
  end 
end

  def self.all
    @@all
  end
  
  def save
    self.class.all << self
  end

  def self.find_or_create_by_name(title)
    if  find_by_name(title)
      find_by_name(title)
   else 
     create_by_name(title)
    end
  end

  def self.alphabetical
    Song.all.sort_by { |song| song.name } 
    
  end
  
  def self.destroy_all
    Song.all.clear
  end

  def self.new_from_filename(string)
    
   new_string = string.split(".mp3").join(" ").split(" - ")
   instance = Song.create
   instance.name = new_string[1]
   instance.artist_name = new_string[0]

   instance
  end

  def self.create_from_filename(song)
    new_parse = Song.new_from_filename(song)
    @@all << new_parse
  end
  binding.pry
end
