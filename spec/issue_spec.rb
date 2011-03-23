# -*- encoding: utf-8 -*-

require './spec/helper'

describe Issue do

  it "must format itself to title and labels" do
    issue = Issue.new(title: "I am the title", labels: ["label 1", "label 2"], number: 11)
    issue.to_title_and_labels.should == "\e[7m11\e[0m - \e[32mI am the title\e[0m - label 1 label 2"
  end
  
  it "must format itself" do
    issue = Issue.new(title: "I am the title", labels: ["label 1", "label 2"], number: 11, body: "this is the body")
    issue.to_string.should == "\e[7m11\e[0m - \e[32mI am the title\e[0m\n\e[47mlabel 1 label 2\e[0m\nthis is the body"
  end
  
end
