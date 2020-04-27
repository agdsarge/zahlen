require 'pry'
require_relative './natura.rb'
require_relative './zahlen.rb'

class Ordered_Pair

    @@all_z = Set[]
    @@all_q = Set[]
    attr_reader :first_term, :second_term, :zahlen, :quoziente

    def initialize(term1, term2)
        @first_term, @second_term = term1, term2
        if term1.class == Natura and term2.class == Natura
            idiot_var = true
            @@all_z.each do |equi_cls| #every e is a zahl if it exists
                if self.zahl_equiv_relation(equi_cls.literal.to_a[0])
                    equi_cls.literal << self unless self.first_term.literal == equi_cls.literal.to_a[0].first_term.literal
                    @zahlen = equi_cls
                    idiot_var = false
                    break
                end
            end
            if idiot_var
                z_translation = first_term.translation - second_term.translation
                z = Zahl.new(z_translation, Set[self])
                @zahlen = z
                @@all_z << z
                #Zahl.new(z_translation, Set[self])
            end
        end

    end

    def zahl_equiv_relation(op2)
        #check if selfterm1 + op2term2 == selfterm2 + op2term1
        # given <a,b> ~ <c,d> => true if a + d == b + c
        ad = self.first_term.n_add(op2.second_term)
        bc = self.second_term.n_add(op2.first_term)
        ad.literal == bc.literal #q and w are separate instances, so we compare the literals
    end


    # def quoz_equivalent_relation(op2)
    #     #check if selfterm1 * op2term2 == selfterm2 * op2term2
    #     ad = self.first_term.z_mult(op2.second_term)
    #     bc = self.second_term.z_mult(op2.first_term)
    #     ad.literal == bc.literal
    # end

    #every ordered pair of integers has an associated integer

    def pretty_print
        puts "<#{self.first_term.translation}, #{self.second_term.translation}>"
    end

    def print_literal
        puts "<#{self.first_term.literal}, #{self.second_term.literal}"
    end

    def self.all_z
        @@all_z
    end
end

def z_add(x, y)
    a, b = x.first_term, x.second_term
    c, d = y.first_term, y.second_term
    sum = Ordered_Pair.new(a+c, b+d)
    puts sum.pretty_print
end
#
# puts Ordered_Pair.all_z.to_a.length

#z_add(x,y)
