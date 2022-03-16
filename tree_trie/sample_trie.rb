class Node
    attr_accessor :data,:children,:is_term,:counter
    def initialize(data)
        @data = data
        @children = []
        @is_term = false
        @counter = 1
    end
end

def insert(root,word)
    node = root
    # p node
    for char in word.chars
        is_child_found = false
        for child in node.children
            if child.data == char
                # this child had encountered this much times
                child.counter += 1
                node = child
                is_child_found = true
            end
        end
        unless is_child_found
            new_node = Node.new(char)
            node.children << new_node
            node = new_node
        end
    end
    node.is_term = true
end

def printTriePaths(root,path,result)
    return unless root
    path << root.data
    if root.children == []
        # print root.data," "
        # result << path
        # p result
        print path,"\n"
        # return [path]
    end

    for child in root.children
        # path << root.data
        # print child.data," ",child.counter,"\n"
        # paths = printTriePaths(child,path)
        printTriePaths(child,path,result)
    end
    path.pop()
    # return paths
    # path.pop()
    # printPaths(root.right,path
end

def printTriePathsIteratively(root)
    return unless root

    stack = [ root ]
    result = []
    str = ''
    while stack.length() != 0
        node = stack.pop
        str = str + node.data
        p node.data
        if node.children == []
            result << str
            
            print "\n"
        end
        for child in node.children
            stack << child
        end
    end
    return result
end

def findWordsWPrefix(root,prefix)
    return [] unless root
    return [] if root.children == []
    node = root
    is_child_found = false
    for charI in 0..prefix.chars.length()
        for child in node.children
            if child.data == prefix[charI]
                p child.data
                if charI == prefix.length() - 1
                    is_child_found = true
                end
                node = child
            end
        end
    end
    if is_child_found == false and charI == prefix.length() - 1
        return []
    else
        return node
    end
end

def findPrefixWord(root,prefixWord,path)
    return unless root
    unless root.data == '*'
        path += root.data
    end

    if root.children == []
        print path," "
    end

    for child in root.children
        findPrefixWord()
    end
end

trie = Node.new('*')

insert(trie, "cat")
insert(trie, "crusial")
insert(trie, "cut")
insert(trie, "cravings")
insert(trie, "crunchy")
insert(trie, "apple")
insert(trie, "ant")

# p printTriePathsIteratively(trie,[])
result = []
path = []
p printTriePaths(trie,path,result)
p result
node = findWordsWPrefix(trie,"cr")
p node.counter
printTriePaths(node,path,result)
if node != []
    p node.children.length()
end
# paths = fetchTriePaths(node,[])
p printTriePathsIteratively(node)