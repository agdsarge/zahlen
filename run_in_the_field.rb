
require 'set'
require_relative './natura.rb'
require_relative './ordered_pairs.rb'
require_relative './zahlen.rb'
require_relative './quoziente.rb'


# x = Quoziente.create(1, 5)
# puts x.translation
# # a = Quoziente.create(2, 1)
# y = Quoziente.create(1, 3)
# puts y.translation
# # puts x.translation
# # puts a.translation
#
# z = x * y
# w = z / y
# puts w.translation

def run
    puts "Hello. This program is like a Rube Goldberg machine."
    puts "I will set a variable, x, equal to 0.2."
    x = 0.2
    puts "x is equal to #{x}, and it is a #{x.class}."
    puts "A number multiplied by one equals itself; 1 * n == n."
    puts "Furthermore, any number divided by itself equals 1; n/n = 1."
    y = 3
    puts "I will set a variable, y, equal to 3.0."
    puts "y is equal to #{y}, and it is a #{y.class}."
    puts "Let's multiply x by y. We will call it w."
    z = x*y
    puts "x * y is w, which is equal to #{z}."
    puts "z / y is #{z / y}."
    puts "It seems that x * y / y is not equal to x."
    puts "boolean comparison: #{x == z / y}"
    puts "\n\n"
    puts "Quelle horreur."
    gets
    puts "Let's try my way instead"
    gets
    puts "I will set a variable, x, equal to 0.2."
    x = Quoziente.create(1, 5)
    puts "x is equal to #{x.translation}, and it is a #{x.class}."
    puts "Quoziente is a class I defined for this blog post."
    puts "I will set a variable, y, equal to 3.0."
    y = Quoziente.create(3, 1)
    puts "y is equal to #{y.translation}, and it is also a #{y.class}."
    puts "Now for the moment of truth."
    z = x * y
    w = z / y
    puts "Indeed, is #{x.translation} equal to #{w.translation} ?"
    puts "Hooray! It worked!"
    puts "Thank you for coming to my TED talk."
end

run
