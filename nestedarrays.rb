

first_xo = ['x', 'o'].sample #getting a random xo for the new array
second_xo = (['x', 'o'] - [first_xo]).first #gives you the other random element of the array
sorted_board = (Array.new(4, first_xo) + Array.new(5, second_xo)).shuffle #gives you random four or five of each element
final_board = Array.new(3) { sorted_board.shift(3) } #gives you final board by pushing each element into nested arrays, three and three

p final_board #driver code

roster = [["Number", "Name", "Position", "Points per Game"],
          ["12","Joe Schmo","Center",[14, 32, 7, 0, 23] ],
          ["9", "Ms. Buckets ", "Point Guard", [19, 0, 11, 22, 0] ],
          ["31", "Harvey Kay", "Shooting Guard", [0, 30, 16, 0, 25] ], 
          ["7", "Sally Talls", "Power Forward", [18, 29, 26, 31, 19] ], 
          ["22", "MK DiBoux", "Small Forward", [11, 0, 23, 17, 0] ]]

def convert_roster_format(roster) #passing in the parameter roster, which is a hash
  converted_roster = [] #creating a new array
  roster[1..-1].each do |row| #iterating through the array from the second index to the last
    converted_roster << roster[0].zip(row) #matching each indice of first array row with corresponding indice of other rows 
  end
  converted_roster #return that converted array
end

formatted_roster = convert_roster_format(roster) #formatted roster equals return of converted roster
 
hashed_rosters = formatted_roster.map { |player| Hash[player] } #pass in the array

#driver code
puts hashed_rosters[0]["Name"] == "Joe Schmo"   # outputs true
puts hashed_rosters[2]["Position"] == "Shooting Guard" # outputs true
