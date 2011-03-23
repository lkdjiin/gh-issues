# -*- encoding: utf-8 -*-

require './spec/helper'

describe Main do

  it "must output all issues" do
    main = Main.new File.join($GH_ISSUES_PATH, 'spec')
    expected = %q{11 - User can add a new set of levels - Story
12 - change max size display - Story Tk
6 - multi player support - Story
5 - save/load a game/position - Story
4 - Console UI should provide a way to know names of sets - Story
8 - scrolling in curses ui - Curses Story}
    $stdout.should_receive(:puts).with(expected)
    main.all
  end
  
  it "must output first issue" do
    main = Main.new File.join($GH_ISSUES_PATH, 'spec')
    $stdout.should_receive(:puts).with("11 - User can add a new set of levels\nStory\nin the folder: \r\n    ~/.rsokoban/data")
    main.first
  end
  
end
