require 'pry'

class Ordered_Pair

    @@some = []

    attr_reader :first_term, :second_term
    def initialize(term1, term2)
        @first_term, @second_term = term1, term2
        self.belongs_to_zahl
    end

    def zahl_equiv_relation(op2)
        #check if selfterm1 + op2term2 == selfterm2 + op2term1
        # given <a,b> ~ <c,d> => true if a + d == b + c
        if self.class == Natural and op2.class == Natural
            q = self.first_term.add(op2.second_term)
            w = self.second_term.add(op2.first_term)
            q.literal == w.literal #q and w are separate instances, so we compare the literals
        end
    end

    #every ordered pair of integers has an associated integer

    def self.belongs_to_one_zahlen
    end

    def pretty_print
        puts "<#{self.first_term.translation}, #{self.second_term.translation}>"
    end

    def print_literal
        puts "<#{self.first_term.literal}, #{self.second_term.literal}"
    end

    def self.some
        @@some
    end
end
