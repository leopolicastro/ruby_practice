require 'romans'


puts "My totally sweet testing script"
puts ""
puts "input | expected | actual"
puts "------|----------|-------"
puts "4     | IV       | #{4.to_s_roman}"
puts "9     | IX       | #{9.to_s_roman}"
puts "13    | XIII     | #{13.to_s_roman}"
puts "1453  | MCDLIII  | #{1453.to_s_roman}"
puts "1646  | MDCXLVI  | #{1646.to_s_roman}"
