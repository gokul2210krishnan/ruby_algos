# import json

# class Trie(object):
#    def __init__(self):
#       self.child = {}

#    def print(self):
#        print(self.child)
#    def insert(self, word):
#       current = self.child
#       for l in word:
#          if l not in current:
#             current[l] = {}
#          current = current[l]
#       current['#']=1
#    def search(self, word):
#       current = self.child
#       for l in word:
#          if l not in current:
#             return False
#          current = current[l]
#       return '#' in current
#    def startsWith(self, prefix):
#       current = self.child
#       for l in prefix:
#          if l not in current:
#             return False
#          current = current[l]
#       return True
# ob1 = Trie()
# ob1.insert("apple")
# ob1.insert("armor")
# ob1.insert("ant")
# ob1.insert("orphan")
# ob1.insert("orange")
# ob1.print()
# print(ob1.search("apple"))
# print(ob1.search("app"))
# print(ob1.startsWith("app"))
# ob1.insert("app")
# print(ob1.search("app"))
from typing import Tuple
class TrieNode(object):
    """
    Our trie node implementation. Very basic. but does the job
    """
    
    def __init__(self, char: str):
        self.char = char
        self.children = []
        # Is it the last character of the word.`
        self.word_finished = False
        # How many times this character appeared in the addition process
        self.counter = 1

    def print(self):
        print(str(self.char) + str(self.children) + str(self.word_finished))
    

def add(root, word: str):
    """
    Adding a word in the trie structure
    """
    node = root
    for char in word:
        found_in_child = False
        # Search for the character in the children of the present `node`
        for child in node.children:
            if child.char == char:
                # We found it, increase the counter by 1 to keep track that another
                # word has it as well
                child.counter += 1
                # And point the node to the child that contains this char
                node = child
                found_in_child = True
                break
        # We did not find it so add a new chlid
        if not found_in_child:
            new_node = TrieNode(char)
            node.children.append(new_node)
            # And then point node to the new child
            node = new_node
    # Everything finished. Mark it as the end of a word.
    node.word_finished = True

def print(root):
    node = root
    for child in root.children:
        # print(child.char,child.children,child.word_finished)
        child.print()

def find_prefix(root, prefix: str) -> Tuple[bool, int]:
    """
    Check and return 
      1. If the prefix exsists in any of the words we added so far
      2. If yes then how may words actually have the prefix
    """
    node = root
    # If the root node has no children, then return False.
    # Because it means we are trying to search in an empty trie
    if not root.children:
        return False, 0
    for char in prefix:
        char_not_found = True
        # Search through all the children of the present `node`
        for child in node.children:
            if child.char == char:
                # We found the char existing in the child.
                char_not_found = False
                # Assign node as the child containing the char and break
                node = child
                break
        # Return False anyway when we did not find a char.
        if char_not_found:
            return False, 0
    # Well, we are here means we have found the prefix. Return true to indicate that
    # And also the counter of the last node. This indicates how many words have this
    # prefix
    return True, node.counter

if __name__ == "__main__":
    root = TrieNode('*')
    add(root, "hackathon")
    add(root, 'hack')
    root.print()

    print(find_prefix(root, 'hac'))
    print(find_prefix(root, 'hack'))
    print(find_prefix(root, 'hackathon'))
    print(find_prefix(root, 'ha'))
    print(find_prefix(root, 'hammer'))