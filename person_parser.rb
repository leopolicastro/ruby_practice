require 'csv'
require 'date'


class Person
  def initialize(args)
    @id = args[:id]
    @first_name = args[:first_name]
    @last_name = args[:last_name]
    @email = args[:email]
    @phone = args[:phone]
    @created_at = DateTime.parse(args[:created_at])
  end

  def to_a
    [@id, @first_name, @last_name, @email, @phone, @created_at]
  end
end

class PersonParser
  attr_reader :file

  def initialize(file)
    @file = file
    @people ||= []
  end

  def people
    CSV.foreach(@file, {headers: true, header_converters: :symbol}) do |row|
      @people << Person.new(row)
    end 
    @people
  end

  def save
    headers = CSV.read(@file).to_a.first
    CSV.open(@file, "w") do |line|
      line << headers
      @people.each do |person|
        line << person.to_a
      end
    end
  end
end

parser = PersonParser.new('sample.csv')

puts "There are #{parser.people.size} people in the file '#{parser.file}'."

