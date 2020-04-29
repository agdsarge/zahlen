require 'set'

require_relative './natura.rb'
require_relative './ordered_pairs.rb'
require_relative './zahlen.rb'
require_relative './quoziente.rb'

def test
    #this is a comment
    # a = Natura.new(10) #good
     b = Natura.new(0)
     c = Natura.new(1)
    d = Natura.new(2)
    e = Natura.new(13)
    # f = Natura.new(6)

    # puts (a + b) == (b + a)
    # puts (a * b) == (b * a)
    # puts (a * c) == (c * a)
    zer = Ordered_Pair.new(b, b).zahlen
    n_eleven = Ordered_Pair.new(d, e).zahlen

    puts (zer * n_eleven).translation

    # tree = Ordered_Pair.new(a, b).zahlen #tree is Z 3
    # puts "ONE DOWN"
    # tree2 = Ordered_Pair.new(c, d).zahlen #tree is Z 3
    # puts "HI"
    # puts tree2.literal

end

test
