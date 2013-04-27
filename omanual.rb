#!/usr/bin/ruby
require 'rubygems'
require 'nokogiri'
require 'optparse'
require 'open-uri'
##############################
#
# file: omanual.rb 
# author: Jim Barkley 
# updated: 27 April 2013
#
# usage: TBD
#
##############################
#


options = {}
OptionParser.new do |opts|
      options[:verbose] = false
      options[:validate] = false
      options[:parse] = false
      options[:scrape] = false

      opts.banner = "Usage: omanual.rb [options] file1 file2 ..."

      opts.on("-v", "--[no-]verbose", "Run verbosely") do |v|
        options[:verbose] = true
      end

      #opts.on("-p", "--parse", "Parse omanual file") do |p|
      #  options[:parse] = true
      #end


      opts.on("-p", "--parse [FILENAME]", "parse file", "(parse omanual.xml file)") do |file|
        options[:parse] = true
        options[:parsefile] = file || ''
      end

      opts.on("-s", "--scrape [FILENAME]", "scrape file", "(scrape url and convert to omanual)") do |url|
        options[:scrape] = true
        options[:scrapeurl] = url || ''
      end



end.parse!

if (options[:verbose] == true) 
  p "options=" 
  p options
  p "ARGV=" 
  p ARGV
end

if (options[:parse] == true) 
  f = File.open(options[:parsefile])
  doc = Nokogiri::XML(f)
  f.close
  if (doc.errors.empty?)
      puts "document parsed with no errors"
  else 
      puts doc.errors 
  end
end


if (options[:scrape] == true) 
  open(options[:scrapeurl]) {|f|
        f.each_line {|line| p line}
  }
end







