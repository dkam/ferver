module Ferver
  # By default, serve files from current location when the gem is called.
  DEFAULT_FILE_SERVER_DIR_PATH = './'

  class << self
      attr_accessor :configuration
  end

  def self.configuration
    @configuration ||= Configuration.new
  end

  def self.reset
    @configuration = Configuration.new
  end

  def self.configure
    yield(configuration)
  end

  class Configuration
    attr_accessor :directory_path, :username, :password

    # Return the absolute path to the directory Ferver is serving files from.
    #
    def directory_path
      @directory_path || Ferver::DEFAULT_FILE_SERVER_DIR_PATH
    end

    def username
      @username 
    end

    def password
      @password 
    end
  end
end
