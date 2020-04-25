class Array
    def successor
        self.union([self])
    end

    def predecessor
        self[-1]
    end
end

class Natural
    @@some = [[]] #zero is the empty set.

    attr_reader :notation, :translation
    def initialize(ordinal)
        while @@some.length <= ordinal
            @@some << @@some[-1].successor
        end
        @notation = @@some[ordinal]
        @translation = ordinal
    end

    def construct_from_notation(arr)
        Natural.new(arr.length)
    end

    def next
        construct_from_notation(self.notation.successor)
    end

    def previous
        construct_from_notation(self.notation.predecessor)
    end

    def add(nat_b)
        if nat_b.notation == []
            return self
        elsif self.notation == []
            return nat_b
        else
            self.next.add(nat_b.previous)
        end
    end

    def multiply(nat_b)
        if nat_b.notation == []
            return nat_b
        elsif self.notation == []
            return self
        elsif nat_b.notation == [[]]
            return self
        elsif self.notation == [[]]
            return self
        else
            self.add(self.multiply(nat_b.previous))
        end
    end

    def compare(nat_b) #returns array. lower then higher, if possible
        if self.notation == nat_b.notation
            return [self, nat_b, "=="]
        else
            self.notation.include?(nat_b.notation) ? [nat_b, self] : [self, nat_b]
        end
    end

    def self.my_set_o_naturals
        @@some
    end
end
