require 'pry'

class Ordered_Pair
    attr_reader :first_term, :second_term
    def initialize(term1, term2)
        @first_term, @second_term = term1, term2
    end

    def zahl_equiv_relation(op2)
        #check if selfterm1 + op2term2 == selfterm2 + op2term1
        # given <a,b> ~ <c,d> => true if a + d == b + c
        q = self.first_term.add(op2.second_term)
        w = self.second_term.add(op2.first_term)
        q.notation == w.notation #q and w are separate instances, so we compare the notations
    end

    def pretty_print
        puts "<#{self.first_term.translation}, #{self.second_term.translation}>"
    end

    def print_notation
        puts "<#{self.first_term.notation}, #{self.second_term.notation}"
    end
end
