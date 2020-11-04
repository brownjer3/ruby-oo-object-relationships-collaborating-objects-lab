require 'pry'
class MP3Importer
    attr_accessor :path

    def initialize(path)
        @path = path
        #@files = []
    end

    def files
        Dir["#{path}/**/*.mp3"].collect {|file| file.delete_prefix("#{path}/")}
    end

    def import
        self.files.collect {|file| Song.new_by_filename(file)}
    end

end