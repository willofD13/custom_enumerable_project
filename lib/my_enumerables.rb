module Enumerable
  # Your code goes here
  def my_each
    return to_enum{:my_each} unless block.given?

    for element in self do
      yield element
    end
  end

end

# You will first have to define my_each
# on the Array class. Methods defined in
# your enumerable module will have access
# to this method
class Array
  # Define my_each here
  def my_each
    return to_enum{:my_each} unless block.given?

    for element in self do
      yield element
    end
  end
  def 
   
  end
end
