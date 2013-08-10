require 'colorize'

class Sudoku

  BOARD_SIZE = 9

  def initialize(board_string)
    @board_string = board_string
    @board = Board.new
    until @board_string == ''
      @board << @board_string.slice!(0..BOARD_SIZE-1)
    end
    @board.map! {|row| row.split('')}
  end

  def move_to_next_cell(x, y)
    case x
    when 0..7
      [x+1, y]
    when 8
      return [0,y+1] if y < 8
      [0,0]
    end
  end

  def row_nums(x, y)
    @board[x]
  end

  def column_nums(x, y)
    column_nums = []
    x = 0
    while x <= 8
      column_nums << @board[x][y]
      x = x + 1
    end
    column_nums
  end

  def mega_row(x, y)
    mega(x)
  end

  def mega_column(x, y)
    mega(y)
  end

  def mega(p)
    if p <= 2
      return [0, 1, 2]
    elsif p <= 5
      return [3, 4, 5]
    else
      return [6, 7, 8]
    end
  end

  def box_nums(x, y)
    box_nums = []
    (mega(x)).each do |x|
      (mega(y)).each do |y|
        box_nums << @board[x][y]
      end
    end
    box_nums
  end

  def solve!
    #p @board
    possible = *("1".."9")
    x, y = 0, 0
    while @board.flatten.include?("0")
      if @board[x][y] == "0"
        used_nums = (row_nums(x, y) + column_nums(x, y) + box_nums(x, y)).uniq
        available = possible - used_nums
        if available.length == 1
          @board[x][y] = available[0]
          @board.flatten.join
        else
          x, y = move_to_next_cell(x,y)
        end
      end

      x, y = move_to_next_cell(x,y)

    end
    @board
  end
end

class Board < Array
  def to_s
    self.map! {|i| i.join(" ") }
    puts "------------------------"
    puts "#{self[0].insert(5, " | ").insert(15, " | ")}".red
    puts "#{self[1].insert(5, " | ").insert(15, " | ")}".yellow
    puts "#{self[2].insert(5, " | ").insert(15, " | ")}".green
    puts "------------------------"
    puts "#{self[3].insert(5, " | ").insert(15, " | ")}".blue
    puts "#{self[4].insert(5, " | ").insert(15, " | ")}".magenta
    puts "#{self[5].insert(5, " | ").insert(15, " | ")}".red
    puts "------------------------"
    puts "#{self[6].insert(5, " | ").insert(15, " | ")}".yellow
    puts "#{self[7].insert(5, " | ").insert(15, " | ")}".green
    puts "#{self[8].insert(5, " | ").insert(15, " | ")}".blue
    puts "------------------------"
  end
end

game = Sudoku.new('619030040270061008000047621486302079000014580031009060005720806320106057160400030')
print game.solve!
