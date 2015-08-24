module Ferver
  class FoundFile
    attr_reader :file_name, :path_to_file, :etag, :mtime, :size

    alias_method :name, :file_name

    def initialize(directory, file_name)
      @file_name = file_name
      @path_to_file = File.join(directory, file_name)
      @etag = Digest::SHA1.hexdigest( File.read(@path_to_file ) ) if valid?
      @mtime = File.mtime(@path_to_file) if valid?
      @size = File.size(@path_to_file) if valid?
    end

    def valid?
      File.file?(path_to_file) && File.size(path_to_file) > 0
    end
  end
end
