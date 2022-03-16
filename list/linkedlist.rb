class LinkedList
    def initialize
        @head = nil
    end

    def append_before_head(value)
        new_head = Node.new(value) # create class and assign value
        new_head.next = @head
        @head = new_head
    end

    def append_first(value)
        if @head == nil
            @head = Node.new(value)
        else
            append_before_head(value)
        end
    end

    def append_end(value)
        if @head
            find_tail.next = Node.new(value)    
        else
            @head = Node.new(value)
        end
    end

    def append_after_ng(node,value)
        new_node = Node.new(value)
        new_node.next = node.next
        node.next = new_node
    end

    def append_after(prev_value,value)
        node = find(prev_value)
        return unless node

        append_after_ng(node,value)
    end

    def find(value)
        node = @head
        return false if !node
        return node if node.value == value
        # while ( node = node.next )
        #     return node if node.value == value
        # end
        return node if node.value == value while ( node = node.next )
        return false
    end

    def append_before(present_value,value)
        node = @head
        return unless node
        return append_before_head(value) if node.value == present_value

        node = find_before(present_value)
        return unless node
        append_after_ng(node,value)
    end

    public def delete(value)
        node = @head
        return unless node
        return @head = nill if @head.value == value && @head.next == nil
        return @head = @head.next if @head.value == value && @head.next != nil
        prev_node = find_before(value)
        prev_node.next = prev_node.next.next
    end

    def find_before(value)
        node = @head
        return false unless node
        return node if node.next.value == value
        return node if node.next.value == value while ( node = node.next )
        return false
    end
    
    def find_tail
        node = @head
        return node if !node.next
        return node if !node.next while( node = node.next )
    end

    def print
        node = @head
        node_value = []
        if node != nil
            node_value.push(node.to_s)
            while(node = node.next)
                node_value.push(node.to_s)
            end
        end
        p node_value
    end
end

class Node 
    attr_accessor :next
    attr_accessor :value
    def initialize(val)
        @value = val
        @next = nil
    end
    def to_s
        "#{@value}"
    end
end

list = LinkedList.new
list.print
list.append_first(3)
list.print
list.append_first(2)
list.print
list.append_end(5)
list.print
list.append_after(5,4)
list.print
p (list.find(6) == false) ? "node not found" : "node found"
list.append_before(5,6)
p (list.find(6) == false) ? "node not found" : "node found"
list.print()
list.delete(5)
list.print()