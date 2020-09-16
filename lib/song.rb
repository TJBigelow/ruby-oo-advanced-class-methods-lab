require 'pry'
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
    @song = self.new
    self.all.push(@song)
    @song
  end

  def self.new_by_name(song_name)
    @song = self.new
    @song.name = song_name
    @song
  end

  def self.create_by_name(song_name)
    @song = self.create
    @song.name = song_name
    @song
  end

  def self.find_by_name(song_name)
    self.all.find{|song| song.name == song_name}
  end

  def self.find_or_create_by_name(song_name)
    self.find_by_name(song_name) || self.create_by_name(song_name)
  end

  def self.alphabetical
    self.all.sort_by{|song| song.name}
  end

  def self.new_from_filename(filename)
    @song = self.new
    @array = filename.split(' - ')
    @array.each {|value| value.delete_suffix!('.mp3')}
    @song.artist_name = @array[0]
    @song.name = @array[1]
    @song
  end

  def self.create_from_filename(filename)
    @song = self.create
    @array = filename.split(' - ')
    @array.each {|value| value.delete_suffix!('.mp3')}
    @song.artist_name = @array[0]
    @song.name = @array[1]
    @song
  end

  def self.destroy_all
    self.all.clear
  end
end
