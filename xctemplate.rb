#!/usr/bin/env ruby

require 'FileUtils'

templateName = ARGV[0]
home = Dir.home
output = File.join(home, "/Library/Developer/Xcode/Templates/File\ Templates/Custom/"+ templateName +".xctemplate")
FileUtils::mkdir_p output
FileUtils.copy_entry "./"+ templateName +".xctemplate", output


output = File.join(home, "/Applications/Xcode.app/Contents/Developer/Library/Xcode/Templates/File\ Templates/Custom/"+ templateName +".xctemplate")
FileUtils::mkdir_p output
FileUtils.copy_entry "./"+ templateName +".xctemplate", output
