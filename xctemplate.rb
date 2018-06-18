#!/usr/bin/env ruby

require 'FileUtils'

# Template Path from Argument
templatePath = ARGV[0]
# Template Name
templateName = File.basename templatePath

applicationsPath = "/Applications/Xcode.app/Contents/Developer/Library/Xcode/Templates/File\ Templates/Custom/"
libraryPath = "/Library/Developer/Xcode/Templates/File\ Templates/Custom/"

class FolderUtil
    # This create a new folder in the path, by deleting anithing there to override it
    def createAndCopyToFolder(fromPath, toPath)
        cleanFolderAt(toPath)
        FileUtils::mkdir_p toPath
        FileUtils.copy_entry fromPath, toPath
    end

    # Safe folder remove
    def cleanFolderAt(path)
        if File.directory?(path)
            FileUtils.remove_dir(path)
        end
    end
end

util = FolderUtil.new

# User Home
home = Dir.home

# First Location to save the template
outputPath = File.join(home, applicationsPath + templateName)
util.createAndCopyToFolder(templatePath, outputPath)

# Second Location to save the template
outputPath = File.join(home, libraryPath + templateName)
util.createAndCopyToFolder(templatePath, outputPath)
