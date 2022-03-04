# Write a method, all_vowel_pairs, that takes in an array of words and returns all pairs of words
# that contain every vowel. Vowels are the letters a, e, i, o, u. A pair should have its two words
# in the same order as the original array. 
#
# Example:
#
# all_vowel_pairs(["goat", "action", "tear", "impromptu", "tired", "europe"])   # => ["action europe", "tear impromptu"]
def all_vowel_pairs(words)
    vowels = "aeiou"
    vowels = vowels.split("")
    arr = []
    i = 0
    while i < words.length - 1
        j = i + 1
        while j < words.length
        
           if vowels.all? {|vowel| (words[i] + words[j]).include?(vowel)}
                arr << words[i] + " " + words[j]
           end
           j += 1
        end
        i += 1
    end
    arr

end
p all_vowel_pairs(["goat", "action", "tear", "impromptu", "tired", "europe"])   # => ["action europe", "tear impromptu"]

# Write a method, composite?, that takes in a number and returns a boolean indicating if the number
# has factors besides 1 and itself
#
# Example:
#
# composite?(9)     # => true
# composite?(13)    # => false
def composite?(num)

    if num < 2
        return true
    end

    (2...num).each do |number|

        if num % number == 0 
            return true
        end

    end
    false

end
p composite?(9)     # => true
p composite?(13)    # => false

# A bigram is a string containing two letters.
# Write a method, find_bigrams, that takes in a string and an array of bigrams.
# The method should return an array containing all bigrams found in the string.
# The found bigrams should be returned in the the order they appear in the original array.
#
# Examples:
#
# find_bigrams("the theater is empty", ["cy", "em", "ty", "ea", "oo"])  # => ["em", "ty", "ea"]
# find_bigrams("to the moon and back", ["ck", "oo", "ha", "at"])        # => ["ck", "oo"]
def find_bigrams(str, bigrams)
    arr = []
    bigrams.each do |ele|

        if str.include?(ele)
            arr << ele
        end


    end
    arr
end

class Hash
    # Write a method, Hash#my_select, that takes in an optional proc argument
    # The method should return a new hash containing the key-value pairs that return
    # true when passed into the proc.
    # If no proc is given, then return a new hash containing the pairs where the key is equal to the value.
    #
    # Examples:
    #
    # hash_1 = {x: 7, y: 1, z: 8}
    # hash_1.my_select { |k, v| v.odd? }          # => {x: 7, y: 1}
    #
    # hash_2 = {4=>4, 10=>11, 12=>3, 5=>6, 7=>8}
    # hash_2.my_select { |k, v| k + 1 == v }      # => {10=>11, 5=>6, 7=>8})
    # hash_2.my_select                            # => {4=>4}
    def my_select(&prc)
        hash = Hash.new
        if prc == nil
            
            self.each {|k,v| hash[k] = v if k == v}
            
        else

            self.each {|k,v| hash[k] = v  if prc.call(k,v)}
        end
        hash
    end
end

                         # => {4=>4}
class String
    # Write a method, String#substrings, that takes in a optional length argument
    # The method should return an array of the substrings that have the given length.
    # If no length is given, return all substrings.
    #
    # Examples:
    #
    # "cats".substrings     # => ["c", "ca", "cat", "cats", "a", "at", "ats", "t", "ts", "s"]
    # "cats".substrings(2)  # => ["ca", "at", "ts"]
    def substrings(length = nil)
        #array version of the string.
        list_str = self.split("")
        arr = []
        if length == nil || length < 2
            while list_str.length > 0
                i = 0 
                list_str.each do |char|
                    arr << list_str[0..i].join("")
                    i += 1
                end
            list_str.shift
            end
        else
            while list_str.length > 0
                
                list_str.each_with_index do |char,idx|
                    if (idx + length -1 ) < list_str.length 
                        if !arr.include?(list_str[idx..idx+length-1].join(""))
                            arr << list_str[idx..idx+length-1].join("")
                        end
                    end
                    
                end
            list_str.shift
            end
        end
        arr
    end


    # Write a method, String#caesar_cipher, that takes in an a number.
    # The method should return a new string where each char of the original string is shifted
    # the given number of times in the alphabet.
    #
    # Examples:
    #
    # "apple".caesar_cipher(1)    #=> "bqqmf"
    # "bootcamp".caesar_cipher(2) #=> "dqqvecor"
    # "zebra".caesar_cipher(4)    #=> "difve"
    def caesar_cipher(num)
        alphabet = "abcdefghijklmnopqrstuvwxyz"
        list_str = self.split("")

        
        list_str.map do |char|
            
            if (alphabet.index(char) + num ) >= 26
                safe_shift = (alphabet.index(char) + num) % 26
            else
                safe_shift = alphabet.index(char) + num
            end

            if alphabet.include?(char)
                alphabet[ safe_shift]
            else
                char
            end
        end.join("")

    end
end

