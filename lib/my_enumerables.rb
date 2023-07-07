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

  def my_select
    return to_enum{:my_select} unless block_given? 
    
    arr = []
    my_each { |i| arr << i if yield(i)}
    return arr
  end

  def my_all?
    result = true
    if block_given?
      my_each { |i| result = false if  yield(i) == false}
    else 
      my_each { |i| result = false if i == false}
    end 
    result
  end

  def my_any?
    result = false
    if block_given?
      my_each { |i| result = true if  yield(i) == true}
    else 
      my_each { |i| result = true if i == true}
    end 
    result
  end

  def my_none?
    result = true
    if block_given?
      my_each { |i| result = false if  yield(i) == true}
    else 
      my_each { |i| result = false if i == true}
    end 
    result
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
