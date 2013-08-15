require 'nokogiri'
require 'open-uri'

class Comment 

attr_reader :user, :text 
  def initialize(user, text)
    @text = text
    @user = user
  end
  
end

class Post

  def initialize(params)
    @file = parse_file(params)
    @comment_list = []
  end

  def parse_file(file)
    Nokogiri::HTML(parse_live_url(file))
  end

  def parse_live_url(html_file)
    open(html_file)
  end

  def title 
    @file.search('.title > a:first-child').map { |title| title.inner_text }
  end

  def url
    @file.search('.title > a:first-child').map {|url| url['href']}
  end

  def points
    @file.search('.subtext > span:first-child').map { |span| span.inner_text}
  end

  def user_id
    @file.search('.subtext > a:nth-child(2)').map { |user| user.inner_text}
  end

  def add_comment(user, text)
    @comment_list << Comment.new(user, text)
  end

  def comments
    users = @file.search('.comhead > a:first-child').map {|users| users.inner_text}
    comments = @file.search('.comment > font').map {|comments| comments.inner_text}
    users_and_comments = users.zip(comments)
    users_and_comments.each do |full_comment|
      @comment_list << Comment.new(full_comment[0], full_comment[1])
    end
    @comment_list
  end

  def print
    @comment_list.each do |comment|
      puts "#{comment.user}:\n #{comment.text} \n \n"
    end
  end
end

ab_testing = Post.new(ARGV.first)
ab_testing.comments 
ab_testing.add_comment("John", "example comment")
ab_testing.print
