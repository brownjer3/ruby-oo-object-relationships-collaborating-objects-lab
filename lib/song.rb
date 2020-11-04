require 'pry'
class Song
    attr_accessor :name, :artist
    @@all = []

    def initialize(name)
        @name = name
        @@all << self
    end

    def self.all
        @@all
    end

    def self.new_by_filename(filename)
        file_name_arr = filename.split(" - ")
        new_song = self.new(file_name_arr[1])
        new_song.artist = Artist.find_or_create_by_name(file_name_arr[0])
        new_song
    end

    def artist_name=(artist_name)
        self.artist = Artist.find_or_create_by_name(artist_name)
    end

end