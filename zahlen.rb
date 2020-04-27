require_relative "./natura.rb"
require_relative "./ordered_pairs.rb"
require 'pry'
require 'set'


class Zahl
    @@all_zahlen = []

    attr_reader :translation, :literal

    def initialize(translation, eq_class)
        @translation = translation
        @literal = eq_class
        @@all_zahlen << self
    end

    # def self.construct_from_natural(n_obj)
    #     Zahlen.new(Ordered_Pair.new(@zero, n_obj))
    # end

    #compare
    #add
    #subtract
    #multiply
    #negation

    def z_neg
        a = self.literal.to_a[0].first_term
        b = self.literal.to_a[0].second_term
        Ordered_Pair.new(b, a).zahlen
    end

    def z_add(zahl_b)
        #<a,b> + <c,d> = <a+c, b+d>
        #binding.pry
        raise "arg must be Zahl" unless zahl_b.class == Zahl
        a = self.literal.to_a[0].first_term
        b = self.literal.to_a[0].second_term
        c = zahl_b.literal.to_a[0].first_term
        d = zahl_b.literal.to_a[0].second_term
        Ordered_Pair.new(a + c, b + d).zahlen
        # self.literal.to_a[0].first_term.n_add(zahl_b.literal.to_a)
    end

    def +(zahl_b)
        self.z_add(zahl_b)
    end

    def z_subtract(zahl_b)
        self + zahl_b.z_neg
    end

    def -(zahl_b)
        z_subtract(zahl_b)
    end

    def z_multiply(zahl_b)
        raise "arg must be Zahl" unless zahl_b.class == Zahl
        a = self.literal.to_a[0].first_term
        b = self.literal.to_a[0].second_term
        c = zahl_b.literal.to_a[0].first_term
        d = zahl_b.literal.to_a[0].second_term

        ac = a * c
        bd = b * d
        ad = a * d
        bc = b * c

        Ordered_Pair.new(ac + bd, ad + bc).zahlen
    end

    def *(zahl_b)
        z_multiply(zahl_b)
    end

    def self.create(translation)
        if translation >= 0
            Ordered_Pair.new(Natura.new(translation), Natura.new(0)).zahlen
        else
            Ordered_Pair.new(Natura.new(0), Natura.new(translation)).zahlen
        end
    end

    def self.all
         @@all_zahlen
    end
end
