# -*- encoding: utf-8 -*-

require 'coco'

$GH_ISSUES_PATH = File.expand_path(File.join(File.expand_path(File.dirname(__FILE__)), '..'))

require './lib/gh-issues'
include GhIssues
