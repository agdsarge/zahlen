require 'pry'
require_relative './natura.rb'
#require_relative './zahlen.rb'

class Ordered_Pair

    @@all_z = Set[]
    @@all_q = Set[]
    attr_reader :first_term, :second_term, :zahlen, :quoziente




    def initialize(term1, term2)
        @first_term, @second_term = term1, term2
        if term1.class == Natura and term2.class == Natura
        #      @zahlen = Zahl.new(nil, self)
            idiot_var = true
            @@all_z.each do |equi_cls| #every e is a Set

                if self.zahl_equiv_relation(equi_cls.to_a[0])
                    equi_cls << self unless self.first_term.literal == equi_cls.to_a[0].first_term.literal
                    idiot_var = false
                    break
                end
            end
            if idiot_var
                @@all_z << Set[self]
            end
        end


        #elsif term1.class == Zahl and term2.class == Zahl
        #     @quoziente = Quoziente.new(nil, self)
        #     @@all_q << self
        # end

    end

    def zahl_equiv_relation(op2)
        #check if selfterm1 + op2term2 == selfterm2 + op2term1
        # given <a,b> ~ <c,d> => true if a + d == b + c
        ad = self.first_term.n_add(op2.second_term)
        bc = self.second_term.n_add(op2.first_term)
        ad.literal == bc.literal #q and w are separate instances, so we compare the literals
    end



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

x = Ordered_Pair.new(Natura.new(0), Natura.new(2))
y = Ordered_Pair.new(Natura.new(0), Natura.new(2))
z = Ordered_Pair.new(Natura.new(1), Natura.new(0))
Ordered_Pair.new(Natura.new(1), Natura.new(3))
w = Ordered_Pair.new(Natura.new(2), Natura.new(4))
Ordered_Pair.new(Natura.new(5), Natura.new(0))

def z_add(x, y)
    a, b = x.first_term, x.second_term
    c, d = y.first_term, y.second_term
    sum = Ordered_Pair.new(a+c, b+d)
    puts sum.pretty_print
end

puts Ordered_Pair.all_z.to_a.length

#z_add(x,y)
