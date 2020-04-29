require 'pry'
class Ordered_Pair

    @@all_z = Construction_Set[]
    @@all_q = Construction_Set[]
    attr_reader :first_term, :second_term, :zahlen, :quoziente

    def initialize(term1, term2)
        @first_term, @second_term = term1, term2
        if term1.class == Natura and term2.class == Natura
            switch = true
            @@all_z.each do |equi_cls| #every e.c. is a zahl if it exists
                # binding.pry
                if self.zahl_equiv_relation(equi_cls.literal.to_a[0])
                    equi_cls.literal << self unless self.first_term.literal == equi_cls.literal.to_a[0].first_term.literal
                    @zahlen = equi_cls
                    switch = false
                    break
                end
            end
            if switch
                z_translation = self.first_term.translation - self.second_term.translation
                z = Zahl.new(z_translation, Construction_Set[self])
                @zahlen = z
                @@all_z << z
            end
        end

        if term1.class == Zahl and term2.class == Zahl and term2.translation != 0
            switch = true
            @@all_q.each do |equi_cls| #if it exists, every e.c. is a quoziente
                if self.quoz_equivalent_relation(equi_cls.literal.to_a[0])
                    equi_cls.literal << self unless self.first_term.literal == equi_cls.literal.to_a[0].first_term.literal
                    @quoziente = equi_cls
                    switch = false
                    break
                end
            end
            if switch
                q_translation = "#{self.first_term.translation} / #{self.second_term.translation}"
                q = Quoziente.new(q_translation, Construction_Set[self])
                @quoziente = q
                @@all_q << q
            end
        end
    end

    def zahl_equiv_relation(op2)
        #check if selfterm1 + op2term2 == selfterm2 + op2term1
        # given <a,b> ~ <c,d> => true if a + d == b + c

        a = self.first_term
        b = self.second_term
        c = op2.first_term
        d = op2.second_term
        ad = a + d
        bc = b + c
        binding.pry
        ad.literal == bc.literal #q and w are separate instances, so we compare the literals
    end

     def quoz_equivalent_relation(op2)
        puts "..."
        p1 = self.first_term
        q1 = self.second_term
        p2 = op2.first_term
        q2 = op2.second_term
        p1q2 = p1 * q2
        p2q1 = p2 * q1
        p1q2 == p2q1
     end

    def pretty_print
        puts "<#{self.first_term.translation}, #{self.second_term.translation}>"
    end

    def print_literal
        puts "<#{self.first_term.literal}, #{self.second_term.literal}"
    end

    def self.all_z
        @@all_z
    end

    def self.all_q
        @@all_q
    end
end
