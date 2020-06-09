# Task 2
# Write a simple program that reverses the text of the input it receives

def reverse(str)
    reverse_string = ""
    str.length.times do |letter|
        reverse_string  = str[letter] + reverse_string
    end
    puts reverse_string
    return reverse_string
end

reverse("dtl ataDoiB") 

# Time Complexity : O(n)
# Space Complexity ; O(n)



# 2- share with us different types of loops you learned ;
# 2-: Answer:
=begin
# @ While loop:

    num1 = 0
    num2 = 5

    while num1 < num2  do
    puts("num 1 = " + num1.to_s )
    num1 +=1
    end


# @ Until loop:

    num1 = 0
    num2 = 5
    until num1 > num2
        num1+=1
        puts num1
    end

# @ For loop:

    for i in 0..7
        puts "current index is : #{i}"
    end
=end

# 3- Is there a way to do this in one line? 
# One line reverse : 
def reverse_one_line(str)
    str.length.times do |letter|;print str[-letter-1];end
end

reverse_one_line("dtl ataDoiB") 


