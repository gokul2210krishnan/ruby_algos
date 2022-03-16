class Node
    attr_accessor :data,:left,:right,:lcount,:rcount
    def initialize(value)
        @data = value
        @lcount = 0
        @rcount = 0
        @left = nil
        @right = nil
    end
end

def printPath(root)
    path = []
    printPaths(root,path)
end

def printPaths(root,path)
    return unless root
    path << root.data    
    if root.left == nil and root.right == nil
        # print root.data," "
        print path,"\n"
    end

    printPaths(root.left,path)
    # path.pop()
    printPaths(root.right,path)
    path.pop()
end

# class Binary_tree
    # def initialize(value)
    #     @root = Node.new(value)
    # end
    def isPBT(count)
        count += 1
        while(count % 2 == 0)
            count /= 2
        end
        if count == 1
            return true
        else
            return false
        end
    end
    def insert_recursively(root,value)
        # level oder traveral
        if root == nil
            root = Node.new(value)
            return root
        end

        if root.lcount == root.rcount
            root.left = insert_recursively(root.left,value)
            root.lcount += 1
        elsif root.rcount < root.lcount
            if isPBT(root.lcount) == true
                root.right = insert_recursively(root.right,value)
                root.rcount += 1
            else
                root.left = insert_recursively(root.left,value)
                root.lcount += 1
            end
        end
        return root
    end
    def insert_iteratively(root,value)
        # level oder traveral
        if root == nil
            root = Node.new(value)
            return root
        end
        queue = [root]
        while queue.length() != 0
            # for x in queue
            #     print "#{x.data} "
            # end
            # print "\n"
            temp = queue[0]
            queue.shift()

            if temp.left == nil
                temp.left = Node.new(value)
                temp.lcount += 1
                break
            else
                queue.append(temp.left)
            end

            if temp.right == nil
                temp.right = Node.new(value)
                temp.rcount += 1
                break
            else
                queue.append(temp.right)
            end
        end
        return root
    end
    def preorder(root)
        if root != nil
            print "#{root.data} "
            preorder(root.left)
            preorder(root.right)
        end
    end
    def postorder(root)
        if root != nil
            postorder(root.left)
            postorder(root.right)
            print "#{root.data} "
        end
    end
    def inorder(root)
        if root != nil
            inorder(root.left)
            print "#{root.data} "
            inorder(root.right)
        end
    end
    def dfs()
        return 
    end
    def bfs()

    end
# end

# tree = Binary_tree.new()
list_tree_data = [1,2,3,4,5,6,7,8,9]
# list_tree_data = [1,2,3,4,5,6]
root = nil
root1 = nil
# root = insert_recursively(root,1)
# root = insert_recursively(root,2)
for data in list_tree_data
    root = insert_recursively(root,data)
end
print "left right"
p root.lcount
p root.rcount
p "\ninsertion done root"
for data in list_tree_data
    root1 = insert_iteratively(root1,data)
end
p "insertion done for root1"

print "\ninorder  == "
inorder(root)
print "\npreorder  == "
preorder(root)
print "\npostorder  == "
postorder(root)
print "\n"

print "\ninorder  == "
inorder(root1)
print "\npreorder  == "
preorder(root1)
print "\npostorder  == "
postorder(root1)
print "\n"
path = []
printPath(root)
# printPaths(root,path)