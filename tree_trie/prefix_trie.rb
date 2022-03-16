class Node
    attr_accessor :data,:is_word,:children,:counter
    def initialize(data)
        @data = data
        @children = []
        @is_word = false
        @counter = 1
    end
end

def insertWordI(root,word)
    node = root
    for char in word.chars
        # print char 
        is_child_found = false
        for child in node.children
            # print child.data
            if child.data == char
                node = child
                child.counter += 1
                is_child_found = true
            end
        end
        unless is_child_found
            new_node = Node.new(char)
            node.children << new_node
            node = new_node
        end
    end
    node.is_word = true
end

def printT(root,path,level,charList,prefix)
    return unless root
    # print root.data
    charList[level] = root.data
    print level,charList[level],root.data,root.is_word,"\n"
    if root.children == [] || root.is_word == true
        print "path == ",charList,"\n"
        temp = ''
        print charList,level,"\n"
        for x in 0..level
            if charList[x] != '*'
                temp += charList[x]
            end
        end
        path << temp
    end
    for child in root.children
        return if prefix.chars[level] != child.data && level <= prefix.chars.length()-1
        if prefix.chars[level] == child.data && level <= prefix.chars.length()-1
            print "child.data::",child.data,"\n"
            printT(child,path,level+1,charList,prefix)
        end
        if level > prefix.chars.length()-1
            printT(child,path,level+1,charList,prefix)
        end
    end
end 

def printAll(root)
    return unless root
    print root.data
    for child in root.children
        printAll(child)
    end
end
# def insertWordR(root,word)

# end

trie = Node.new('*')
insertWordI(trie,"cat")
insertWordI(trie,"cow")
insertWordI(trie,"apple")
insertWordI(trie,"catract")
result = []
printAll(trie)
print "\n"
printT(trie,result,0,[],'ca')
print "result ==",result,"\n"


# # Recursive Function to generate all words
# def getWords(root, result, level, string)
#     return unless root
#     #Leaf denotes end of a word
#     if root.children == []
#         # current word is stored till the 'level' in the character array
#         string[level] = root.data;
#         temp = "";
#         # p string
#         for x in 0..level
#             if string[x] == '*'
#                 next
#             end
#             temp += string[x];
#         end
#         result.push(temp);
#     end
#     for i in 0..26
#         # if root.children != []
#             # Non-None child, so add that index to the character array
#         string[level] = root.data;
#         getWords(root.children[i], result, level + 1, string);
#         # end
#     end
# end
# def findWords(root)
#   result = []
#   chararr = [];
#   for i in 0..20
#     chararr.push(nil);
#   end
#   getWords(root, result, 0, chararr);
#   return result;
# end
# p findWords(trie)