# -*- encoding: utf-8 -*-

module GhIssues

  # Retrieve info about issues
  class Issues
  
    def initialize json_document
      json = JSON.parse(IO.read(json_document), {:symbolize_names => true})
      @issues = []
      json[:issues].each do |issue|
        @issues << Issue.new(issue)
      end
    end
    
    def all
      issues = @issues.collect {|elem| elem.to_title_and_labels}
      issues.join("\n")
    end
    
    def first
      @issues.first.to_string
    end
    
    def by_id(id)
      issue = @issues.select {|elem| elem[:number] == id}.first
      issue.to_string
    end
    
  end
  
end
