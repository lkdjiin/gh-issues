# -*- encoding: utf-8 -*-

require './spec/helper'

describe Issue do

  it "must format itself to title and labels" do
    issue = Issue.new(title: "I am the title", labels: ["label 1", "label 2"])
    issue.to_title_and_labels.should == "I am the title label 1 label 2"
  end
  
  it "must format itself" do
    issue = Issue.new(title: "I am the title", labels: ["label 1", "label 2"], number: 11, body: "this is the body")
    issue.to_string.should == %q{11 I am the title
label 1 label 2
this is the body}
  end
  
end
