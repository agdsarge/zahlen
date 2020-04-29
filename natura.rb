require 'set'

class CSt < Set #Construction_Set
    def literal_successor
        self.union(CSt[self])
    end

    def literal_predecessor
        self.to_a.sort! {|s1, s2| s1 < s2 ? -1 : (s2 < s1 ? 1 : 0)}[-1]
    end

    # def subset(c_set2) #returns the subset/sml c_set
    #     c_set2.include?(self) ? self : c_set2
    # end
    #
    # def superset(c_set2) #returns the super / lrg c_set
    #     c_set2.include?(self) ? c_set2 : self
    # end
end

class Natura
    attr_reader :translation, :literal
    @@all_literals = [CSt[]] #P1. Zero is a natural number
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
            raise "Invalid input - arg2 type" unless literal.class == CSt
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
        self.literal.include?(nat_b.literal) ? (sml, lrg = nat_b, self) : (sml, lrg = self, nat_b)
        sml.literal == CSt[] ? lrg : lrg.next.n_add(sml.previous)
    end

    def +(nat_b)
        self.n_add(nat_b)
    end

    def n_multiply(nat_b)
        raise "arg must be Natura" unless nat_b.class == Natura
        self.literal.include?(nat_b.literal) ? (sml, lrg = nat_b, self) : (sml, lrg = self, nat_b)
        if sml.literal == CSt[]
            return sml
        elsif sml.literal == CSt[CSt[]]
            return lrg
        else
            lrg.n_add(lrg.n_multiply(sml.previous))
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

    private

end
