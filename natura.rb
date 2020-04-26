require 'set'
require 'pry'

class Set
def literal_successor
    self.union(Set[self])
end

def literal_predecessor
    #return biggest
    arr = self.map {|x| x}
    arr.sort! {|e1, e2| s1 < s2 ? -1 : (s2 < s1 ? 1 : 0)}
    arr[-1]
end

end

class Natura
    attr_reader :translation, :literal
    @@all_literals = [Set[]]
    @@all = []
    def initialize(translation=nil, literal=nil)

        raise "Invalid input - no args" unless translation or literal
        if translation and literal
            raise "Invalid input - mismatched args" unless translation == literal.length
        end

        if translation
            raise "Invalid input - arg1 type" unless translation.class == Integer
            while @@all_literals.length <= translation
                @@all_literals << @@all_literals[-1].literal_successor
            end
            @translation = translation
            @literal = @@all_literals[translation]
        else
            raise "Invalid input - arg2 type" unless literal.class == Set
            #@@all_literals is an array
            while !@@all_literals.include?(literal)
                @@all_literals <<  @@all_literals[-1].literal_successor
            end
            @translation = literal.length
            @literal = literal
        end
        @@all << self
    end

    def n_add(nat_b)
        if nat_b.literal == Set[]
            return self
        elsif self.literal == Set[]
            return nat_b
        else
            self.literal_successor.n_add(nat_b.literal_predecessor)
        end
    end

    def +(nat_b)
        self.n_add(nat_b)
    end

    private

end
zero = Natura.new(0, Set[])
fifteen = Natura.new(15, nil)


du = Natura.new(2,nil)
zwei = Natura.new(nil, Set[Set[], Set[Set[]]])

x = du.n_add(zero)
print x.translation

y = du + zero
print y.translation

#fah = du.n_add(zwei)
#print fah.translation



#buzz = Natura.new(nil, nil)


# emp = Set[]
# wun = emp.union(Set[emp])

## du = Natura(2,)
## zwei = Natura(,Set[Set[], Set[Set[]]])
##
