require 'nokogiri'
require 'httparty'
require 'colorize'
require_relative 'util'

class Browser
  def run!
    View.prompt
    View.display
  end
end

class View

  attr_reader :url

  def self.prompt
    puts "Please type a url to view a webpage >> "
    @@url = gets.chomp
  end

  def self.title
    title = ::Page.new(@@url).title
  end

  def self.links
    links = ::Page.new(@@url).links
  end

  def self.char_length
    char_length = ::Page.new(@@url).char_length
  end

  def self.display
    puts "Title: #{self.title.join}"
    puts "Content Length: "+"#{self.char_length}".gsub(/(?<=\d)(?=(?:\d{3})+\z)/, ",").light_red+" chars."
    puts "Links: "+"\n #{links.join("\n")}".light_red
  end

end

Browser.new.run!