# -*- encoding: utf-8 -*-

module GhIssues

  # I hold info of an issue and perform output format.
  # @todo Separate info and formatter in 2 classes.
  class Issue < Hash
  
    def initialize hash
      self.merge!(hash)
    end
    
    def to_title_and_labels
      "#{self[:number].to_s.inverse} - #{self[:title].color(:green)} - #{self[:labels].join(' ')}"
    end
    
    def to_string
      "#{self[:number].to_s.inverse} - #{self[:title].color(:green)}\n#{self[:labels].join(' ').background(:white)}\n#{self[:body]}"
    end
    
  end

end
