require 'set'

class Set
    def literal_successor
        self.union(Set[self])
    end

    def literal_predecessor
        self.to_a.sort! {|s1, s2| s1 < s2 ? -1 : (s2 < s1 ? 1 : 0)}[-1]
    end

end

class Natura
    attr_reader :translation, :literal
    @@all_literals = [Set[]] #P1. Zero is a natural number
    @@all = []
    def initialize(translation=nil, literal=nil)

        raise "Invalid input - no args" unless translation or literal
        if translation and literal
            raise "Invalid input - mismatched args" unless translation == literal.length
        end

        if translation
            raise "Invalid input - arg1 type" unless translation.class == Integer
            while @@all_literals.length <= translation
                @@all_literals << @@all_literals[-1].literal_successor
            end
            @translation = translation
            @literal = @@all_literals[translation]
        else
            raise "Invalid input - arg2 type" unless literal.class == Set
            #@@all_literals is an array
            while !@@all_literals.include?(literal)
                @@all_literals <<  @@all_literals[-1].literal_successor
            end
            @translation = literal.length
            @literal = literal
        end
        @@all << self
    end

    def n_add(nat_b)
        raise "arg must be Natura" unless nat_b.class == Natura
        if nat_b.literal == Set[]
            return self
        elsif self.literal == Set[]
            return nat_b
        else
            self.next.n_add(nat_b.previous)
        end
    end

    def +(nat_b)
        self.n_add(nat_b)
    end

    def n_multiply(nat_b)
        raise "arg must be Natura" unless nat_b.class == Natura
        if nat_b.literal == Set[]
            return nat_b
        elsif nat_b.literal == Set[Set[]]
            return self
        elsif self.literal == Set[]
            return self
        elsif self.literal == Set[Set[]]
            return nat_b
        else
            self.n_add(self.n_multiply(nat_b.previous))
        end
    end

    def *(nat_b)
        self.n_multiply(nat_b)
    end

    def next
        Natura.new(nil, self.literal.literal_successor)
    end

    def previous
        Natura.new(nil, self.literal.literal_predecessor)
    end

end
