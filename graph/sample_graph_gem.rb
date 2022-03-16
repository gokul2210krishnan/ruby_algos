# require 'rgl/adjacency'

# graph = RGL::DirectedAdjacencyGraph.new

# graph.add_edge 1,2
# graph.add_edge 2,3
# graph.add_edge 2,4
# graph.add_edge 2,5
# graph.add_edge 2,6

# p graph.to_s

def depth_first_search(adj_matrix, source_index, end_index)
    node_stack = [source_index]
  
    loop do
        p node_stack
      curr_node = node_stack.pop
      return false if curr_node == nil
      return true if curr_node == end_index
  
    #   p (0..adj_matrix.length-1).to_a.select
    #   p (0..adj_matrix.length-1).to_a
    #   p (0..adj_matrix.length-1)
      children = (0..adj_matrix.length-1).to_a.select do |i| 
        adj_matrix[curr_node][i] == 1
      end
      node_stack = node_stack + children
    end
  end

  def breadth_first_search(adj_matrix, source_index, end_index)
    node_queue = [source_index]
  
    loop do
      p node_queue
      curr_node = node_queue.shift
      return false if curr_node == nil
      return true if curr_node == end_index
  
    #   p (0..adj_matrix.length-1).to_a.select
    #   p (0..adj_matrix.length-1).to_a
    #   p (0..adj_matrix.length-1)
      children = (0..adj_matrix.length-1).to_a.select do |i| 
        adj_matrix[curr_node][i] == 1
      end
      node_queue = node_queue + children
    end
  end 
  adj_matrix = [
    #   a b c d e f
    # a 0 1 1 1 0 0
    # b 0 0 0 0 1 0
    # c 0 0 0 0 0 1
    # d 0 0 0 0 0 1
    # e 0 0 0 0 0 0
    # f 0 0 0 0 0 0

#         a
#        / \
#       c   e
#      /
#     d

 # a  b  c  d  e  f
  [0, 0, 1, 0, 1, 0], # a        
  [0, 0, 1, 0, 0, 1], # b
  [0, 0, 0, 1, 0, 0], # c
  [0, 0, 0, 0, 1, 1], # d
  [0, 0, 0, 0, 0, 0], # e
  [0, 0, 0, 0, 0, 0]  # f
]
p "Source index"
source_index_str = gets
source_index = source_index_str.to_i
p "End index"
end_index_str = gets
end_index = end_index_str.to_i
p "DFS"
p depth_first_search(adj_matrix, source_index, end_index)
p "BFS"
p breadth_first_search(adj_matrix, source_index, end_index)