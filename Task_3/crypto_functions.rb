module Crypto

    def is_prime(n)
        if n < 2
            return false
        end
        lowPrimes = [2, 3, 5, 7, 11, 13, 17, 19, 23, 29, 31, 37, 41, 43, 47, 53, 59, 61, 67, 71, 73, 79, 83, 89, 97, 101, 103, 107, 109, 113, 127, 131, 137, 139, 149, 151, 157, 163, 167, 173, 179, 181, 191, 193, 197, 199, 211, 223, 227, 229, 233, 239, 241, 251, 257, 263, 269, 271, 277, 281, 283, 293, 307, 311, 313, 317, 331, 337, 347, 349, 353, 359, 367, 373, 379, 383, 389, 397, 401, 409, 419, 421, 431, 433, 439, 443, 449, 457, 461, 463, 467, 479, 487, 491, 499, 503, 509, 521, 523, 541, 547, 557, 563, 569, 571, 577, 587, 593, 599, 601, 607, 613, 617, 619, 631, 641, 643, 647, 653, 659, 661, 673, 677, 683, 691, 701, 709, 719, 727, 733, 739, 743, 751, 757, 761, 769, 773, 787, 797, 809, 811, 821, 823, 827, 829, 839, 853, 857, 859, 863, 877, 881, 883, 887, 907, 911, 919, 929, 937, 941, 947, 953, 967, 971, 977, 983, 991, 997]
        if lowPrimes.include? n
            return true
        end
        for prime in lowPrimes
            if n % prime == 0
                return false
            end
        end
        # find number c such that c * 2 ^ r = n - 1
        c = n - 1 # c even bc n not divisible by 2
        while c % 2 == 0 do
            c /= 2 # make c odd
        end 
        
        for i in 0..128
            if not primality_test(n, c)
                return false
            end
        return true
        end
    end
    
    def gcd(pe, q)
        while q > 0 do
            pe, q = q, pe % q
        end
        return pe
    end

    def egcd(a, b)
        s = 0; old_s = 1
        t = 1; old_t = 0
        r = b; old_r = a
        while r != 0 do
            quotient = (old_r / r).floor
            old_r, r = r, old_r - quotient * r
            old_s, s = s, old_s - quotient * s
            old_t, t = t, old_t - quotient * t
        end
        # return gcd, x, y
        return old_r, old_s, old_t
    
    end

    

    def primality_test(n,d)
        a = rand(2..((n-2)-2))
        x = a.pow(d.to_i, n)
        if (x == 1) or x == (n - 1)
            return true       
        end
        # square x
        while d != (n-1) do
            x = x.pow(2,n)
            d *= 2
    
            if x == 1
                return false
            elsif x == (n-1)
                return true
            end
    
        # is not prime
        return false
    
        end
    end
    
    def generate_keys(keysize=1024)
        e = d = n = 0
        pe = generate_large_prime(keysize)
        q = generate_large_prime(keysize)
 
        n = pe * q 
        phiN = (pe - 1) * (q - 1) 
        # choose e  # 1 < e <= phiN  #e must be a strange to phi 
        #stranger numbers if gcd(e,phi) == 1
        while true do
            e = rand(2 ** (keysize-1)...(2 ** keysize-1))
            if gcd(e, phiN) == 1
                break
            end
        end
    
        # choose d
        # d is mod inv of e with respect to phiN, e * d (mod phiN) = 1
        d = modular_inv(e, phiN)
    
        return e, d, n
    
    end
    
    def generate_large_prime(keysize)
        #   return random large prime number of keysize bits in size
        while true do
            num = rand((2 ** (keysize-1))...(2 ** keysize-1))
            if is_prime(num)
                return num
            end
        end
    end

    def modular_inv(a, b)
        gcd, x, y = egcd(a, b)
        if x < 0
            x += b
        end
        return x
    end
end
