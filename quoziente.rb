class Quoziente
    @@all_quoziente = []

    attr_reader :translation, :literal

    def initialize(translation, eq_class)
        @translation = translation
        @literal = eq_class
        @@all_quoziente << self
    end

    def q_neg #works
        a = self.literal.to_a[0].first_term
        b = self.literal.to_a[0].second_term
        Ordered_Pair.new(a.z_neg, b).quoziente
    end

    def q_add(quo_b)
        a = self.literal.to_a[0].first_term
        b = self.literal.to_a[0].second_term
        c= quo_b.literal.to_a[0].first_term
        d = quo_b.literal.to_a[0].second_term
        ad = a * d
        bc = b * c
        bd = b * d
        num = ad + bc
        Ordered_Pair.new(num, bd).quoziente
    end

    def +(quo_b)
        q_add(quo_b)
    end

    def q_subtract(quo_b)
        self + quo_b.q_neg
    end

    def q_multiply(quo_b)
        a = self.literal.to_a[0].first_term
        b = self.literal.to_a[0].second_term
        c = quo_b.literal.to_a[0].first_term
        d = quo_b.literal.to_a[0].second_term
        ac = a * c
        bd = b * d
        Ordered_Pair.new(ac, bd).quoziente
    end

    def *(quo_b)
        q_multiply(quo_b)
    end

    def q_divide(quo_b)
        raise "Cannot divide by zero!" unless quo_b.literal.to_a[0].first_term.translation != 0
        a = self.literal.to_a[0].first_term
        b = self.literal.to_a[0].second_term
        c= quo_b.literal.to_a[0].first_term
        d = quo_b.literal.to_a[0].second_term
        ad = a * d
        bc = b * c
        Ordered_Pair.new(ad, bc).quoziente
    end

    def /(quo_b)
        q_divide(quo_b)
    end

    def self.create(num, denom=1)
        raise "integer inputs, please" unless num.class == Integer and denom.class == Integer
        raise "Denominator cannot be zero! That would break the universe." if denom == 0

        n = Zahl.create(num)
        d = Zahl.create(denom)

        Ordered_Pair.new(n, d).quoziente
    end

    def self.all
         @@all_quoziente
    end

end
