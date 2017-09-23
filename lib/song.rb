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
    song = Song.new
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
    self.all.detect{|s| s.name == song_name}
  end

  def self.find_or_create_by_name(song_name)
    self.find_by_name(song_name) || self.create_by_name(song_name)
  end

  def self.alphabetical
    @@all.sort_by { |word| word.name}
  end

  def self.new_from_filename(name_1)
    new_name = name_1.split(" - ")
    artist_name = new_name[0]
    song_name = new_name[1].gsub(".mp3", "")
    song = self.new
    song.name = song_name
    song.artist_name = artist_name
    song
  end

  def self.create_from_filename(name_1)
    new_name = name_1.split(" - ")
    artist_name = new_name[0]
    song_name = new_name[1].gsub(".mp3", "")
    song = self.create
    song.name = song_name
    song.artist_name = artist_name
    song
  end

  def self.destroy_all
    self.all.clear
  end

end

# the_middle = Song.create_by_name("The Middle")
# nick_song = Song.create_by_name("Nicks Song")
# new3 = Song.create_by_name("ABC")
# new2 = Song.create_by_name("ZEFg")
#
# #Song.find_by_name("The Middle")
# #Song.create_by_name("Newwer song")
#
# #song_1 = Song.find_or_create_by_name("Blank Space")
# #song_1 = Song.find_or_create_by_name("Blank Space")
#
# #Song.alphabetical
#
# song = Song.new_from_filename("Taylor Swift - Blank Space.mp3")
#
# the_middle = Song.create_by_name("The Middle")
# nick_song = Song.create_by_name("Nicks Song")
# new3 = Song.create_by_name("ABC")
# new2 = Song.create_by_name("ZEFg")
#
# #Song.find_by_name("The Middle")
# #Song.create_by_name("Newwer song")
#
# #song_1 = Song.find_or_create_by_name("Blank Space")
# #song_1 = Song.find_or_create_by_name("Blank Space")
#
# Song.alphabetical
