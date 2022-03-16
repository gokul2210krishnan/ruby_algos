number1 = gets
number2 = gets
print "string1 == #{number1}"
print "string2 == #{number2}"
str_num1 = number1.to_i
print "str_num1 == #{str_num1}\n"
str_num2 = number2.to_i
print "str_num2 == #{str_num2}\n"
sum = str_num1 + str_num2
print sum

print "je8yewjkjke"\
        "e"

class Node
    attr_accessor :sample,:sample1
    @@sample = 0
    @sample2 = 1
    def initialize(data)
        @sample1 = data
        @sample = data
    end
    def to_s
        p "this is #{@sample2}"
        return @sample1
    end
end

node1 = Node.new("1");
p node1.sample
p node1.sample1
p node1.to_s