require_relative "./naturliche.rb"
require_relative "./ordered_pairs.rb"
require 'pry'



class Zahlen
    @zero = Natural.new(0)
    @@some = []

    attr_reader :translation, :literal

    def initialize(ord_pr)          #self.some is an array of zahl_objs
        eqs = @@some.find {|z| z.literal[0].zahl_equiv_relation(ord_pr)}

        if eqs
            eqs.literal << ord_pr
            binding.pry
            eqs
        else
            @translation = ord_pr.second_term.translation - ord_pr.first_term.translation
            @literal = [ord_pr]
            @@some << self
        end

        eqs
    end



    # def self.construct_from_natural(n_obj)
    #     Zahlen.new(Ordered_Pair.new(@zero, n_obj))
    # end

    #compare
    #add
    #subtract
    #multiply
    #negation

    def self.some
         @@some
    end
end

alpha = Natural.new(5)
beta = Natural.new(3)

gamma = Natural.new(4)
delta = Natural.new(2)


pair1 = Ordered_Pair.new(alpha, beta)
pair2 = Ordered_Pair.new(gamma, delta)

zp1 = Zahlen.new(pair1)
puts zp1.translation
puts "<><><><><><<<><><><><><><<"
zp2 = Zahlen.new(pair2)
puts zp2.literal

puts "&&&&&&&&&&&&&&&&&&&&&&&&&&&"
#zdelt = Zahlen.construct_from_natural(delta)
#puts zdelt.literal
#puts zdelt.translation



#check_some to see if one is there
#self.some.find{|z| z.equiv_relation(ord_pari)} if this true, then add to z
#else. set translation
