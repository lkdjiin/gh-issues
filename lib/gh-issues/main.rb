# -*- encoding: utf-8 -*-

module GhIssues

  # Output issue(s)
  class Main
  
    def initialize current_folder
      @issues = Issues.new(File.join(current_folder, 'gh-issues.json'))
    end
    
    def all
      puts @issues.all
    end
    
    def first
      puts @issues.first
    end
    
    def by_id(id)
      puts @issues.by_id(id)
    end
    
  end
  
end
