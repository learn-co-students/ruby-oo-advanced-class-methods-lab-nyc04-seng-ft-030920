require 'pry'
class Song
  attr_accessor :name, :artist_name
  @@all = []

  def save
    @@all << self
  end

  def self.create
    song = Song.new
    song.save
    song
  end

  def self.new_by_name(song_name)
    song = Song.new
    song.name = song_name
    song
  end

  def self.all
    @@all
  end

  def self.create_by_name(song_name)
    song = self.create
    song.name = song_name
    song
  end

  def self.find_by_name(song_name)
    @@all.find {|song| song.name == song_name}
  end

  def self.find_or_create_by_name(song_name)
    self.find_by_name(song_name) ? self.find_by_name(song_name) : self.create_by_name(song_name)
  end

  def self.alphabetical
    @@all.sort {|song_a, song_b| song_a.name <=> song_b.name}
  end

  def self.new_from_filename(filename)
    parts = filename.split(" - ")
    name = parts[1].gsub(".mp3", "")
    artist_name = parts[0]
    song = Song.new
    song.artist_name = artist_name
    song.name = name
    song
  end

  def self.create_from_filename(filename)
    parts = filename.split(" - ")
    name = parts[1].gsub(".mp3", "")
    artist_name = parts[0]
    song = Song.create
    song.artist_name = artist_name
    song.name = name
    song
  end

  def self.destroy_all
    @@all = []
  end

end
