# -*- encoding: utf-8 -*-

require './spec/helper'

describe Issue do

  it "must format itself to title and labels" do
    issue = Issue.new(title: "I am the title", labels: ["label 1", "label 2"], number: 11)
    issue.to_title_and_labels.should == " 11 \e[32mI am the title\e[0m label 1, label 2"
  end
  
  it "must format itself" do
    issue = Issue.new(title: "I am the title", labels: ["label 1", "label 2"], number: 11, body: "this is the body")
    issue.to_string.should == " 11 \e[32mI am the title\e[0m label 1, label 2\n\e[34mthis is the body\e[0m"
  end
  
end
