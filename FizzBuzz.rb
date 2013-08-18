

#Write a method called super_fizzbuzz which takes as its input 
#an Array of integers.

#It should return a "fizzbuzzed" Array, i.e., the array is 
#identical to the input with the following substitutions:

#Multiples of 3 should be replaced with the string "Fizz"
#Multiples of 5 should be replaced with the string "Buzz"
#Multiples of 15 should be replaced with the string "FizzBuzz"


def super_fizzbuzz(array)
  result = []
  array.each do |x|
    if x % 15 == 0
      result << "FizzBuzz"
    elsif x % 5 == 0
      result << "Buzz"
    elsif x % 3 == 0
      result << "Fizz"
    else
      result << x
    end
  end
  result
end

p super_fizzbuzz([5,2,3,67,15])