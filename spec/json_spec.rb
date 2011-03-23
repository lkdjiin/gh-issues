# -*- encoding: utf-8 -*-

require './spec/helper'

describe JSON do

  before :all do
    @document = IO.read(File.join($GH_ISSUES_PATH, 'spec/gh-issues.json')) 
  end
  
  it "must return a Hash" do
    parsed = JSON.parse(@document, symbolize_names: true)
    parsed.is_a?(Hash).should be_true
  end
  
  it "must give the title of an issue" do
    parsed = JSON.parse(@document, symbolize_names: true)
    parsed[:issues].first[:title].should == "User can add a new set of levels"
  end
  
end
