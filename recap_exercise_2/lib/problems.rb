# Write a method, least_common_multiple, that takes in two numbers and returns the smallest number that is a mutiple
# of both of the given numbers
require "byebug"
def least_common_multiple(num_1, num_2)
    
    min = [num_1,num_2].min
    max = [num_1,num_2].max

    max_lcm = []
    min_lcm = []
    i = 1 
    while true

        max_lcm << max * i
        min_lcm << min * i

    min_lcm.each do |ele| 
         if max_lcm.include?(ele)
            return ele
         end
    end

    i += 1
    end
end


# Write a method, most_frequent_bigram, that takes in a string and returns the two adjacent letters that appear the
# most in the string.
def most_frequent_bigram(str)
    #need a list of all possible adjacent bigrams (hash frequency?)
    arr = []

    i = 0
    while i <  str.length - 1
        arr << str[i..i+1]
        i += 1
    end
    
    hash = arr.inject({}) do |h,v|

        if h[v]
            h[v] += 1
        else
            h[v] = 1
        end
        h
    end
  
    hash.each do |key,value|

        return key if value == hash.values.max
    end
    #call count and include? on the str.
    #add those values 
end


class Hash
    # Write a method, Hash#inverse, that returns a new hash where the key-value pairs are swapped
    def inverse

        hash = {}

        self.each do |h,v|

            hash[v] = h

        end

        hash
    end
end


class Array
    # Write a method, Array#pair_sum_count, that takes in a target number returns the number of pairs of elements that sum to the given target
    def pair_sum_count(num)
        arr = 0
        i = 0
        while i < self.length - 1
            j = i + 1
            while j < self.length

                if self[i] + self[j] == num
                    arr += 1
                    
                end
                j += 1
            end
            i += 1
            
        end
        arr

    end

    # Write a method, Array#bubble_sort, that takes in an optional proc argument.
    # When given a proc, the method should sort the array according to the proc.
    # When no proc is given, the method should sort the array in increasing order.
    #
    # Sorting algorithms like bubble_sort, commonly accept a block. That block accepts
    # two parameters, which represents the two elements in the array being compared.
    # If the block returns 1, it means that the second element passed to the block
    # should go before the first (i.e. switch the elements). If the block returns -1,
    # it means the first element passed to the block should go before the second
    # (i.e. do not switch them). If the block returns 0 it implies that
    # it does not matter which element goes first (i.e. do nothing).
    #
    # This should remind you of the spaceship operator! Convenient :)
    def bubble_sort(&prc)

        if prc == nil
            sorted = false
            
            while sorted == false
                swapped  = false
                i = 0
                while i < self.length - 1

                    if self[i] > self[i+ 1]

                        self[i] , self[i + 1] = self[i + 1] ,self[i]
                        swapped = true
                    end
                    i += 1
                end

                swapped ? sorted = false : sorted = true

            end
            self
        else
            sorted = false
            
            while sorted == false
                swapped  = false
                i = 0
                while i < self.length - 1
                    # debugger
                    if prc.call(self[i] ,self[i+ 1]) == 1

                        self[i] , self[i + 1] = self[i + 1] ,self[i]
                        swapped = true
                        p self
                        puts "point 1"
                 
                    end
                    
                    i += 1
                    puts "point end_of_pass"
                end

                swapped ? sorted = false : sorted = true
                puts "point check_if_sorted"
            end
            self

        end

    end
end


# load "/home/chuck/App_academy/W2D4/recap_exercise_2/lib/problems.rb"
# a = [5,1,12,34,11,2,5]
# puts a.bubble_sort

# puts [4, 12, 2, 8, 1, 14, 9, 25, 24, 81].bubble_sort { |a, b| a.to_s <=> b.to_s }

