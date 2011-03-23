# -*- encoding: utf-8 -*-

require './spec/helper'

describe GitHub do

  before :all do
    @local_repository = File.join($GH_ISSUES_PATH, 'spec/repo')
  end

  it "must retrieve user name" do
    github = GitHub.new @local_repository
    github.user.should == 'lkdjiin'
  end
  
  it "must retrieve remote repository name" do
    github = GitHub.new @local_repository
    github.repository.should == 'gh-issues'
  end
  
  it "must raise error when current folder doesn't contain a '.git' folder" do
    bad_repository = File.join($GH_ISSUES_PATH, 'spec/no_git_repo')
    lambda {GitHub.new(bad_repository)}.should raise_error(NoGitError)
  end
  
  it "must raise error when current folder doesn't contain a '.git/config' file" do
    bad_repository = File.join($GH_ISSUES_PATH, 'spec/no_config_repo')
    lambda {GitHub.new(bad_repository)}.should raise_error(NoConfigError)
  end
  
  it "must raise error when current folder contains a bad '.git/config' file" do
    bad_repository = File.join($GH_ISSUES_PATH, 'spec/bad_config_repo')
    lambda {GitHub.new(bad_repository)}.should raise_error(BadConfigError)
  end
  
end
