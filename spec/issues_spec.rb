# -*- encoding: utf-8 -*-

require './spec/helper'

describe Issues do

  before :all do
    document = File.join($GH_ISSUES_PATH, 'spec/gh-issues.json')
    @issues = Issues.new(document)
  end
  
  it "must list all issues" do
    @issues.all.should == "\e[7m11\e[0m - \e[32mUser can add a new set of levels\e[0m - Story
\e[7m12\e[0m - \e[32mchange max size display\e[0m - Story Tk
\e[7m6\e[0m - \e[32mmulti player support\e[0m - Story
\e[7m5\e[0m - \e[32msave/load a game/position\e[0m - Story
\e[7m4\e[0m - \e[32mConsole UI should provide a way to know names of sets\e[0m - Story
\e[7m8\e[0m - \e[32mscrolling in curses ui\e[0m - Curses Story"
  end
  
  it "must format output for the first issue" do
    @issues.first.should == "\e[7m11\e[0m - \e[32mUser can add a new set of levels\e[0m\n\e[47mStory\e[0m\nin the folder: \r\n    ~/.rsokoban/data"
  end
  
  it "must format output for the given id" do
    @issues.by_id(6).should == "\e[7m6\e[0m - \e[32mmulti player support\e[0m\n\e[47mStory\e[0m\n"
  end
end


