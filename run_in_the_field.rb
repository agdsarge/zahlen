 #["./naturliche.rb", "./ordered_pairs.rb" "./zahlen.rb"].each {|file| require_relative file}
require_relative './natura.rb'


#x = Natura.new(5) #24 is pretty big
four = Natura.new(4)
three = Natura.new(3)
#seven = Natura.new(7)
#nine = Natura.new(9)
 #sum = seven + nine
#puts sum.translation


puts (four + three).translation

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
