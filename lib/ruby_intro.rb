# When done, submit this entire file to the autograder.

# Part 1

# Takes an array of integer as an argument and returns the sum of its elements.
# For an empty array it should return zero
def sum arr
  return 0 if arr.length == 0
  arr.reduce(:+)
end

# Takes an array of integers as an argument and returns the sum of its two largest elements.
# For an empty array it should return zero.
# For an array with just one element, it should return that element.
def max_2_sum arr
  return 0 if arr.empty?
  return arr[0] if arr.length == 1
  
  v1 = nil
  v2 = nil
  
  arr.each do |e|
    if v1.nil?
      v1 = e
    else
      if v1 < e
        v2 = v1 if v2.nil? || v2 < v1
        v1 = e
      else
        v2 = e if v2.nil? || v2 < e
      end
    end
  end
  
  return v1 + v2
end

# Define a method `sum_to_n?(array, n)` that takes an array of integers and an additional 
# integer, n, as arguments and returns true if any two elements in the array of integers sum to n.
# An empty array should sum to zero by definition.
def sum_to_n? arr, n
  return n == 0 if arr.empty?
  return false if arr.length == 1
  
  lfound = false
  arr.combination(2).each do |pair|
     if pair[0]+pair[1] == n
        lfound = true
        break
     end
  end
  
  return lfound
end

# Part 2
# Define a method `hello(name)` that takes a string representing a name and 
# returns the string "Hello, " concatenated with the name.
def hello(name)
   "Hello, #{name}"
end

# Define a method `starts_with_consonant?(s)` 
# that takes a string and returns true if it starts with a consonant and false otherwise.
# (For our purposes, a consonant is any letter other than A, E, I, O, U.) 
# NOTE: be sure it works for both upper and lower case and for nonletters!
def starts_with_consonant? s
  return false if s.length == 0
  return ( s[0] =~ /[a-z]/i )  && ! ( s[0] =~ /[aeiou]/i )

end

# Define a method `binary_multiple_of_4?(s)` that takes a string 
# and returns true if the string represents a binary number that is a multiple of 4.
# NOTE: be sure it returns false if the string is not a valid binary number!
def binary_multiple_of_4? s
  return false if ! s.tr('01','').empty?  || s.empty?
  return true  if s.tr('0','').empty?
  return false if s.length < 3
  return ( s.slice(0,s.length - 2).tr('0','').length > 0 && s.slice(s.length-2,2) == "00" )
end

# Part 3

class BookInStock
  attr_accessor :isbn, :price


  def initialize(isbn, price)
     if ( isbn.empty? || price <= 0)
       raise ArgumentError
     end
     @isbn  = isbn
     @price = price
  end

  def price_as_string
    "$#{'%.2f' % @price}"
  end

end
