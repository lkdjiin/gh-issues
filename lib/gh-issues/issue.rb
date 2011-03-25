# -*- encoding: utf-8 -*-

module GhIssues

  # I hold info of an issue and perform output format.
  # @todo Separate info and formatter in 2 classes.
  class Issue < Hash
  
    def initialize hash
      self.merge!(hash)
    end
    
    def to_title_and_labels
      "#{format_id} #{self[:title].color(:green)} #{self[:labels].join(', ')}"
    end
    
    def to_string
      "#{to_title_and_labels}\n#{self[:body].color(:blue)}"
    end
    
    private
    
    def format_id
      format("%3d", self[:number])
    end
    
  end

end
