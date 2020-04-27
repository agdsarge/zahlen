 #["./naturliche.rb", "./ordered_pairs.rb" "./zahlen.rb"].each {|file| require_relative file}
require_relative './natura.rb'
require_relative './ordered_pairs.rb'
require_relative './zahlen.rb'

#"OUR GOAL IS TO PROVE 0.1 + 0.2 = 0.3"

z = Zahl.create(0)
w = Zahl.create(1)

a = Zahl.create(2)
b = Zahl.create(4)

puts (b * b).translation

puts (a * z).translation # => 0
puts (a * w).translation # => 2
puts (a + z).translation # => 2

#puts Ordered_Pair.all_z.to_a.length # => 4 it works!
#puts Zahl.all.map {|z|z.translation}

#pair1 = Ordered_Pair.new(alpha, beta)
#pair2 = Ordered_Pair.new(gamma, delta)

#pair1.pretty_print
#pair2.pretty_print
#puts pair1.zahl_equiv_relation(pair2)

#puts alpha.add(beta).translation
#puts alpha.multiply(beta).translation

#puts beta.multiply(gamma).compare(alpha.add(delta)).map {|n| n.translation}

#print Natural.my_set_o_naturals[-1]
#puts "\n\n"
#puts alpha.translation
#print alpha.literal
#puts alpha.literal.length == alpha.translation
