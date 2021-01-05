class Graph
  
  attr_reader :nodes

  def initialize
    @nodes = {}
  end
  
  def add_node(node)
    @nodes[node.value] = node
  end
  
  def add_edge(node1, node2)
    @nodes[node1.value].add_edge(@nodes[node2.value])
    @nodes[node2.value].add_edge(@nodes[node1.value])
  end

  def has_node(value)
    return !nodes[value].nil?
  end

  def get_node(value)
    return nodes[value]
  end
end

class Node
  
  attr_reader :value, :adjacent_nodes
  
  def initialize(value)
    @value = value
    @adjacent_nodes = []
  end
  
  def add_edge(adjacent_node)
    @adjacent_nodes << adjacent_node
  end
  
  def has_adjacent_node(node)
    return adjacent_nodes.include? node
  end
end

class Board

	attr_accessor :graph
	
	BOARD_SIZE = 8

	def initialize()
		@graph = Graph.new

		for row in 0..BOARD_SIZE-1
			for col in 0..BOARD_SIZE-1
				board_position = [row, col]
        if @graph.has_node(board_position)
          node = @graph.get_node(board_position)
        else
				  node = Node.new(board_position)
          @graph.add_node(node)
        end
				positions = possible_moves(row,col)
				for elem in positions
					elem_position = [elem[0],elem[1]]
          if @graph.has_node(elem_position)
            elem_node = @graph.get_node(elem_position)
          else
            elem_node = Node.new(elem_position)
            @graph.add_node(elem_node)
          end
          if !node.has_adjacent_node(elem_node)
            @graph.add_edge(node, elem_node)
          end
				end
			end
		end
	end

  def possible_moves(x, y)
  	moves = []
  	possible_moves = [[-1,-2],[-1,2],[-2,-1],[-2,1],[ 1,-2],[1,2],[2,-1],[2,1]]

    for i in possible_moves
    	new_x = x + i[0]
    	new_y = y + i[1]
    	if (new_x >= 0 and new_x < BOARD_SIZE) and (new_y >= 0 and new_y < BOARD_SIZE)
    		moves.push([new_x, new_y])
    	end
    end
  	return moves
	end	
end

class Knight  

  def initialize()
    @board = Board.new
  end

  def knights_moves(start, finish)
    bfs(@board.graph, start, finish)
    path = []
    crawl = finish
    path.append(crawl)

    while @pred[crawl] != -1
      path.append(@pred[crawl])
      crawl = @pred[crawl]
    end

    puts  "You made it in " + (@dist[finish]+1).to_s +  " moves! Here's your path: "
    for i in (path.length-1).downto(0) do
      pp path[i]
    end
  end

  def bfs(graph, start, finish)
    queue = []

    visited = Hash.new(false)
    @dist = Hash.new(10000000)
    @pred = Hash.new(-1)
    
    visited[start] = true
    @dist[start] = 0
    queue.append(start)

    while queue.length != 0
      u = queue[0]
      queue.delete(u)
      adj = graph.get_node(u).adjacent_nodes
      for i in adj
        if visited[i.value] == false
          visited[i.value] = true
          @dist[i.value] = @dist[u] + 1
          @pred[i.value] = u
          queue.append(i.value)
          if i.value == finish
            return true
          end
        end
      end
    end
    return false
  end
end