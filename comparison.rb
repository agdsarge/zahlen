require 'set'



s1 = Set[] #0
s2 = Set[Set[], Set[[]]] #1
s3 = s2.union(s2)
s4=s3.union(s3)

def custom_compare(s1, s2)
    if s1 < s2 #if s1 is a subset of s2, then s1 is less than s2
        return -1
    elsif s2 < s1
        return 1
    else
        return 0
    end
end



def subset_comparison(s1,s2)
    s1 < s2 ? -1 : (s2 < s1 ? 1 : 0)
end





x = [s2, s1, s4, s3]
y = x.sort {|e1, e2| custom_compare(e1,e2)}
z = [s3, s4, s2, s1]
w = z.sort{|e1, e2| subset_comparison(e1, e2)}
print y
puts "\n\n"
puts y[0]
puts y[1]
puts s4 == y[-1]
puts w[-1] == y[-1]
