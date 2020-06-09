# Task 1
#Create a simple ruby class that recieves an input from the console and echos the text provided back to the terminal: 


class Echo
    def self.echoMessage
        puts "Insert some text"
        texte = gets.chomp
        puts "--\nruby says : " + texte + " (:\n--\n" 
    end
end


Echo.echoMessage



#- What happens when you do not provide any input to the system? 
=begin
In this case when you don't provide input to the system 
the system waits in the line of the input until it gets it's data (line 8)
and all the code below dosen't compile.
=end

#   - What a programer should think when dealing with inputs / outputs ? (in a very broad terms)
=begin
 when dealing with inputs/outputs programer should think about:
1) Injection attacks
2) Memory limitation
3) Validations :
when dealing with inputs, programer must be aware of the things the user can insert, and which kind of data the user wants. 
As a result the system might crash and cause theft of information by SQL injection etc.  
If the programer wants to deal with SQL injections and protect the sensitive data in the server side better, he better
do most of the validations in the client side, which can also save time with incorrect data imformation transfer. 
4)Sensitive data must be Encrypted between client side and server side transferring.

=end

    
