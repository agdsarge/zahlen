require_relative "./natura.rb"
require_relative "./ordered_pairs.rb"
require 'pry'
require 'set'


class Zahl
    @@all = []

    attr_reader :translation

    def initialize(translation=nil, ord_pr=nil)
        raise "Invalid input - no args" unless translation or literal
        @literal = Set[]
        if translation
            raise "Invalid input - arg1 type" unless translation.class == Integer
            @translation = translation
            if translation >= 0
                @literal << Ordered_Pair.new(Natura(translation), Natura(0))
            else
                @literal << Ordered_Pair.new(Natura(0), Natura, translation)
            end

        else

        end
    end

    def literal

    end

    # def self.construct_from_natural(n_obj)
    #     Zahlen.new(Ordered_Pair.new(@zero, n_obj))
    # end

    #compare
    #add
    #subtract
    #multiply
    #negation

    def z_add(zahl_b)
        #<a,b> + <c,d> = <a+c, b+d>
        self.literal.to_a[0].first_term.n_add(zahl_b.literal.to_a)

    def self.all
         @@all
    end
end

#first test
#x = Zahl.new(1)
#x.literal


#check_some to see if one is there
#self.some.find{|z| z.equiv_relation(ord_pari)} if this true, then add to z
#else. set translation
