# -*- encoding: utf-8 -*-

require './spec/helper'

describe Issues do

  before :all do
    document = File.join($GH_ISSUES_PATH, 'spec/gh-issues.json')
    @issues = Issues.new(document)
  end
  
  it "must list all issues" do
    @issues.all.should == %q{User can add a new set of levels Story
change max size display Story Tk
multi player support Story
save/load a game/position Story
Console UI should provide a way to know names of sets Story
scrolling in curses ui Curses Story}
  end
  
  it "must format output for the first issue" do
    @issues.first.should == "11 User can add a new set of levels\nStory\nin the folder: \r\n    ~/.rsokoban/data"
  end
  
  it "must format output for the given id" do
    @issues.by_id(6).should == "6 multi player support\nStory\n"
  end
end


