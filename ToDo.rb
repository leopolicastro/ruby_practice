require 'csv'
require 'thor'
 
class List
 
  attr_accessor :list
 
  def initialize(filename)
    @list = []
    @file = filename
    open_file(filename)
  end
 
  def open_file(filename)
    CSV.foreach('list.csv') do |row|
      @list << Task.new({item: row[0]})  #????? why row 0
    end
  end
 
  def list_view
    @list.each_with_index do |item, index|
      puts "#{index}. #{item.item}"
    end
  end
 
  def add(string)
    @list << Task.new(item: string)
    save_to_file
  end
 
  def delete(index)
    @list.delete_at(index)
    save_to_file
  end
 
  def save_to_file
    CSV.open(@file, "w") do |csv_file|
      @list.each do |task|
        csv_file << [task.item]
      end
    end
  end
 
end
 
class Task
  attr_reader :item, :status
  def initialize(args={})
    @item = args[:item]
    @status = args.fetch(:status){:incomplete}
  end
 
  def complete
    @status = :complete
  end
 
end
 
class CommandLine < Thor
 
  @@my_list = List.new('list.csv')
 
  desc "add [task]", "Adds task."
  def add(arg)
    @@my_list.add(arg)
  end
 
  desc "delete [task]", "Deletes task."
  def delete(arg)
    @@my_list.delete(arg.to_i)
  end
 
  desc "complete [id]", "Completes task."
  def complete(index)
    @@my_list.list[index.to_i].complete
  end
 
  desc "list", "List tasks."
  def list
    @@my_list.list_view
  end
 
end
 
CommandLine.start(ARGV)