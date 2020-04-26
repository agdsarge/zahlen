class Array
    def successor
        self.union([self])
    end

    def predecessor ###see below
        self[-1]
    end

    #arrays are ordered, sets are not. so I should have a predecessor
    #method that reflects that.
    #a Natural, n, is less than another Natural, m, if n is a subset of n
    #for example, a0 = [], and b2 = [[], [[]]].
    #thus, a0 < b2
    #with this ordering, we can define a sorting function. Ruby has a built-in one.
    #with a sorted array, we know the max is the predecessor.


end

class Natural
    @@some = [[]] #zero is the empty set.

    attr_reader :literal, :translation
    def initialize(ordinal)
        while @@some.length <= ordinal
            @@some << @@some[-1].successor
        end
        @literal = @@some[ordinal]
        @translation = ordinal
    end

    def construct_from_literal(arr) #######I should write this better.
        Natural.new(arr.length)
    end

    def next
        construct_from_literal(self.literal.successor)
    end

    def previous
        construct_from_literal(self.literal.predecessor)
    end

    def add(nat_b)
        if nat_b.literal == []
            return self
        elsif self.literal == []
            return nat_b
        else
            self.next.add(nat_b.previous)
        end
    end

    def multiply(nat_b)
        if nat_b.literal == []
            return nat_b
        elsif self.literal == []
            return self
        elsif nat_b.literal == [[]]
            return self
        elsif self.literal == [[]]
            return nat_b
        else
            self.add(self.multiply(nat_b.previous))
        end
    end

    def compare(nat_b) #returns array. lower then higher, if possible
        if self.literal == nat_b.literal
            return [self, nat_b, "=="]
        else
            self.literal.include?(nat_b.literal) ? [nat_b, self] : [self, nat_b]
        end
    end

    def self.my_set_o_naturals
        @@some
    end
end

test_arr = [[[], [[]], [[], [[]]]], [[], [[]]], [[]], []]
print test_arr.pure_predecessor


#Natural.new(26)

#print Natural.my_set_o_naturals
#puts Natural.my_set_o_naturals
