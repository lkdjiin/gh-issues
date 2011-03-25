# -*- encoding: utf-8 -*-

require './spec/helper'

describe Main do

  it "must output all issues" do
    main = Main.new File.join($GH_ISSUES_PATH, 'spec')
    expected = " 11 \e[32mUser can add a new set of levels\e[0m Story
 12 \e[32mchange max size display\e[0m Story, Tk
  6 \e[32mmulti player support\e[0m Story
  5 \e[32msave/load a game/position\e[0m Story
  4 \e[32mConsole UI should provide a way to know names of sets\e[0m Story
  8 \e[32mscrolling in curses ui\e[0m Curses, Story"
    $stdout.should_receive(:puts).with(expected)
    main.all
  end
  
  it "must output first issue" do
    main = Main.new File.join($GH_ISSUES_PATH, 'spec')
    $stdout.should_receive(:puts).with(" 11 \e[32mUser can add a new set of levels\e[0m Story\n\e[34min the folder: \r\n    ~/.rsokoban/data\e[0m")
    main.first
  end
  
end
