 #["./naturliche.rb", "./ordered_pairs.rb" "./zahlen.rb"].each {|file| require_relative file}

Natural.new(20) #24 is pretty big

alpha = Natural.new(5)
beta = Natural.new(3)

gamma = Natural.new(4)
delta = Natural.new(2)

pair1 = Ordered_Pair.new(alpha, beta)
pair2 = Ordered_Pair.new(gamma, delta)

#pair1.pretty_print
#pair2.pretty_print
#puts pair1.zahl_equiv_relation(pair2)

zdelt = Zahlen.construct_from_natural(delta)
puts zdelt.notation
puts zdelt.translation


#puts alpha.add(beta).translation
#puts alpha.multiply(beta).translation

#puts beta.multiply(gamma).compare(alpha.add(delta)).map {|n| n.translation}

#print Natural.my_set_o_naturals[-1]
#puts "\n\n"
#puts alpha.translation
#print alpha.notation
#puts alpha.notation.length == alpha.translation
