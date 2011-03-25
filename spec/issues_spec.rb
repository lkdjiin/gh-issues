# -*- encoding: utf-8 -*-

require './spec/helper'

describe Issues do

  before :all do
    document = File.join($GH_ISSUES_PATH, 'spec/gh-issues.json')
    @issues = Issues.new(document)
  end
  
  it "must list all issues" do
    @issues.all.should == " 11 \e[32mUser can add a new set of levels\e[0m Story
 12 \e[32mchange max size display\e[0m Story, Tk
  6 \e[32mmulti player support\e[0m Story
  5 \e[32msave/load a game/position\e[0m Story
  4 \e[32mConsole UI should provide a way to know names of sets\e[0m Story
  8 \e[32mscrolling in curses ui\e[0m Curses, Story"
  end
  
  it "must format output for the first issue" do
    @issues.first.should == " 11 \e[32mUser can add a new set of levels\e[0m Story\n\e[34min the folder: \r\n    ~/.rsokoban/data\e[0m"
  end
  
  it "must format output for the given id" do
    @issues.by_id(6).should == "  6 \e[32mmulti player support\e[0m Story\n\e[34m\e[0m"
  end
end


