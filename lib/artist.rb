
class Artist
    attr_accessor :name
    @@all = []

    def initialize(name)
        @name = name
        @@all << self
    end

    def self.all
        @@all
    end

    def songs
        Song.all.select {|s| s.artist == self }
    end

    def add_song(song_obj)
        song_obj.artist = self
    end

    def self.find_or_create_by_name(name)
        instance = @@all.find {|a| a.name == name}
        instance.nil? ? self.new(name) : instance
    end

    def print_songs
        self.songs.each do |s|
            puts s.name
        end
    end

end