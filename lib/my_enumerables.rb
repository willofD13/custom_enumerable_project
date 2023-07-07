#require 'pry-byebug'
module Enumerable
  # Your code goes here
  def my_each_with_index
   return to_enum{:my_each_with_index} unless block_given?

   i = 0
   while i < self.length do 
    yield(self[i],i)
    i += 1
   end
   self
  end

  def my_select(&block)
    return to_enum{:my_select} unless block_given? 
    
    arr = []
    i = 0
    while i < self.length do 
      yield(self[i])
      
      arr.push(self[i]) if yield(self[i]) == true
      i += 1
    end
    return arr
  end

end


# You will first have to define my_each
# on the Array class. Methods defined in
# your enumerable module will have access
# to this method
class Array
  # Define my_each here
  def my_each
    return to_enum{:my_each} unless block_given?

    for element in self do
      yield element
    end
    self
  end

end
