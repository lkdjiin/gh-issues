# -*- encoding: utf-8 -*-

module GhIssues

  # Raised when there is no '.git' folder in current folder, ie, we are
  # not inside a local git repo.
  class NoGitError < StandardError
  end
  
  # Raised if there is no '.git/config' file.
  class NoConfigError < StandardError
  end
  
  # Raised if we don't know how to parse the '.git/config' file.
  class BadConfigError < StandardError
  end
  
  # I retrieve the GitHub user name and repository name from a local repository.
  class GitHub
  
    attr_reader :user
    
    attr_reader :repository
    
    # @param [String] full path of the local repository
    def initialize folder
      hidden_git = File.join(folder, '.git')
      raise NoGitError unless File.directory?(hidden_git)
      
      config_file = File.join(hidden_git, 'config')
      raise NoConfigError unless File.file?(config_file)
      
      input = IO.readlines(config_file)
      url_line = ''
      input.each {|line| url_line = line if line =~ / *url *=/}
      raise BadConfigError if url_line.empty?
      
      /(?<repository>[\w-]+)\.git$/ =~ url_line
      @repository = repository
      
      /git@github\.com:(?<user>\w+)/ =~ url_line
      @user = user
    end
    
  end

end
