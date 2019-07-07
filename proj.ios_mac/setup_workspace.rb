#!/usr/bin/env ruby
require 'xcodeproj'
xcproj = Xcodeproj::Project.open("COCOS.xcodeproj")
xcproj.recreate_user_schemes
xcproj.save
