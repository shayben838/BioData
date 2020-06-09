require_relative "crypto_functions.rb"
include Crypto

class Crypto_Operations

    def encrypt(msg)
        keysize = 32    
        e, d, n = generate_keys(keysize)
        msg = msg.split("")
        cipher = ""
        for char in msg
            m = char.ord
            cipher += (m.pow(e,n)).to_s + " "
        end
        #cipher += d.to_s 
        key = "" +n.to_s + "$" + d.to_s


        puts ("-Cipher text-  \n"+cipher+"\n"+"-")        

        puts("-Key-  ",key,"-" + " \n")
 #       puts("-Key-  ",n,"-" + " \n")

        return cipher,key
#        return cipher,n

    end


    def decrypt(cipher="",key="")
        
        
        n = key.split("$")[0].to_i
        d = key.split("$")[1].to_i

        msg = ""
        parts = cipher.split()
        parts=parts[0...-1]
    
        for part in parts
            if part
                c = part.to_i
                msg +=(c.pow(d,n)).chr
            end
        end
    
        puts("Original Text : " + msg,"\n")
        return msg        

    end

end


#   --Run--
crypto = Crypto_Operations.new()

enc = crypto.encrypt("Hello Ruby!!")
#enc[0] = Cipher Text
#enc[1] = Public Key
dec = crypto.decrypt(enc[0],enc[1])

  
=begin







































require_relative "crypto_functions.rb"
include Crypto

class Crypto_Operations

    def encrypt(msg)
        keysize = 32    
        e, d, n = generate_keys(keysize)
        msg = msg.split("")
        cipher = ""
        for char in msg
            m = char.ord
            cipher += (m.pow(e,n)).to_s + " "
        end
        cipher += d.to_s 
        puts ("-Cipher text-  \n"+cipher+"\n"+"-")        
        puts("-Key-  ",n,"- \n")
        return cipher,n
    end


    def decrypt(cipher="",n="")
        n = n.to_i
        msg = ""
        parts = cipher.split()
        d = (parts[-1]).to_i
        parts=parts[0...-1]
    
        for part in parts
            if part
                c = part.to_i
                msg +=(c.pow(d,n)).chr
            end
        end
    
        puts("Original Text : " + msg,"\n")
        return msg        
    end
end


#   --Run--
crypto = Crypto_Operations.new()

enc = crypto.encrypt("Hello Ruby!")
#enc[0] = Cipher Text
#enc[1] = Public Key
dec = crypto.decrypt(enc[0],enc[1])

  
=end