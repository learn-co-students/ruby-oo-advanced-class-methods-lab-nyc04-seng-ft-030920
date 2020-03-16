class Song
  attr_accessor :name, :artist_name
  @@all = []

  def self.all
    @@all
  end

  def save
    self.class.all << self
  end

  def self.create
    song = self.new
    @@all << song
    song
  end

  def self.new_by_name(songname)
    song = self.new
    song.name = songname
    song
  end

  def self.create_by_name(songname)
    song = self.new
    song.name = songname
    @@all << song
    song
  end

  def self.find_by_name(songname)
    self.all.find{|song| song.name == songname}
  end

  def self.find_or_create_by_name(songname)
    if self.find_by_name(songname)
      self.find_by_name(songname)
    else self.create_by_name(songname)
    end
  end

  def self.alphabetical
    self.all.sort_by{|instance| instance.name}
  end

  def self.new_from_filename(filename)
    parsed = filename.split(" - ")
    artistpart = parsed[0]
    songpart = parsed[1].chomp(".mp3")

    song = self.new
    song.artist_name = artistpart
    song.name = songpart 
    song
  end

  def self.create_from_filename(filename)
    parsed = filename.split(" - ")
    artistpart = parsed[0]
    songpart = parsed[1].chomp(".mp3")

    song = self.create
    song.artist_name = artistpart
    song.name = songpart 
    song
  end

  def self.destroy_all
    self.all.clear
  end
end
