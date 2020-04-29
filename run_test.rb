require 'set'

require_relative './natura.rb'
require_relative './ordered_pairs.rb'
require_relative './zahlen.rb'
require_relative './quoziente.rb'

def test
    n_keys = %i(zero one two three four five six seven eight nine ten)
    z_keys = %i(zero n_one n_two n_three n_four n_five n_six n_seven n_eight n_nine n_ten)

    nat_hash = {}; n_keys.each_with_index {|k, ind| nat_hash[k] = Natura.new(ind)}
    zahl_hash = {}
    n_keys.each_with_index { |k, ind| zahl_hash[k] = Ordered_Pair.new(nat_hash[k], nat_hash[:zero]).zahlen}
    z_keys.each_with_index { |k, ind| zahl_hash[k] = Ordered_Pair.new(nat_hash[:zero], nat_hash[k]).zahlen}
    #zero: Ordered_Pair.new(nat_hash[:one], nat_hash[:one]).zahlen


    #puts zahl_hash[:zero].translation

    # a = Natura.new(10) #good
    #puts (nat_hash[:three] * nat_hash[:four]).translation

    #puts (zahl_hash[:three] * zahl_hash[:four]).translation
    # f = Natura.new(6)



end

test
