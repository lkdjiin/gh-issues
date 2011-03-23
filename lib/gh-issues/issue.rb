# -*- encoding: utf-8 -*-

module GhIssues

  # I hold info of an issue and perform output format.
  # @todo Separate info and formatter in 2 classes.
  class Issue < Hash
  
    def initialize hash
      self.merge!(hash)
    end
    
    def to_title_and_labels
      "#{self[:number]} - #{self[:title]} - #{self[:labels].join(' ')}"
    end
    
    def to_string
      "#{self[:number]} - #{self[:title]}\n#{self[:labels].join(' ')}\n#{self[:body]}"
    end
    
  end

end
