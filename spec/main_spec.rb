# -*- encoding: utf-8 -*-

require './spec/helper'

describe Main do

  it "must output all issues" do
    main = Main.new File.join($GH_ISSUES_PATH, 'spec')
    expected = %q{User can add a new set of levels Story
change max size display Story Tk
multi player support Story
save/load a game/position Story
Console UI should provide a way to know names of sets Story
scrolling in curses ui Curses Story}
    $stdout.should_receive(:puts).with(expected)
    main.all
  end
  
  it "must output first issue" do
    main = Main.new File.join($GH_ISSUES_PATH, 'spec')
    $stdout.should_receive(:puts).with("11 User can add a new set of levels\nStory\nin the folder: \r\n    ~/.rsokoban/data")
    main.first
  end
  
end
