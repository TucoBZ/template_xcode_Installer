#!/usr/bin/env ruby

require 'FileUtils'

templatePath = ARGV[0]
templateName = File.basename templatePath

home = Dir.home
output = File.join(home, "/Library/Developer/Xcode/Templates/File\ Templates/Custom/"+ templateName)
FileUtils::mkdir_p output
FileUtils.copy_entry templatePath, output


output = File.join(home, "/Applications/Xcode.app/Contents/Developer/Library/Xcode/Templates/File\ Templates/Custom/"+ templateName)
FileUtils::mkdir_p output
FileUtils.copy_entry templatePath, output
