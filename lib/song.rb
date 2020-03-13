require "pry"
class Song

attr_accessor :name, :artist_name


  @@all = []

  def self.all
    @@all
  end

  def self.create
    song = self.new
    song.save
    song
  end

  def self.new_by_name(song_name)
    song = self.new
    song.name = song_name
    song
  end

  def self.create_by_name(song_name)
    song = self.create
    song.name = song_name
    song
  end

  def self.find_by_name(song_name)
    self.all.find {|song| song.name == song_name}
  end

  def self.find_or_create_by_name(song_name)
    self.find_by_name(song_name) ? self.find_by_name(song_name) : self.create_by_name(song_name)
  end

  def self.alphabetical
    self.all.sort_by {|song| song.name}
  end

  def self.filename_cleaner(file)
    clean = file.split(".")[0].split("-")
    clean.map {|str| str.strip}
  end

  def self.new_from_filename(file)
    song_dets = filename_cleaner(file)
    song = self.new_by_name(song_dets[1])
    song.artist_name = song_dets[0]
    song
  end

  def self.create_from_filename(file)
    song_dets = filename_cleaner(file)
    song = self.create_by_name(song_dets[1])
    song.artist_name = song_dets[0]
  end

  def self.destroy_all
    self.all.clear
  end

  def save
    self.class.all << self
  end
end
