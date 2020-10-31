class Node

	include Comparable
	attr_accessor :left, :right
	attr_reader :data

	def <=>(other_data)
		other_data <=> data
	end

	def initialize(data)
		@data = data
		@left = nil
		@right = nil
	end
end

class Tree

	def initialize()
		@root = nil
	end

	def root()
		return @root.data
	end

	def build_tree(arr, s, e)
		if(s > e)
			return nil
		end
		arr = arr.sort.uniq
		mid = (s+e)/2
		@root = Node.new(arr[mid])
		@root.left = build_tree(arr, s, mid-1)
		@root.right = build_tree(arr, mid+1, e)

		return @root
	end

	def insert(data)
		node = Node.new(data)
		current = @root
		while(current != nil)
			if node < current
				current = current.left
				if(current)
			elsif node > current
				current = current.right
			else n
				return
			end
		end
		current = node
	end

	def delete(data)
		node = Node.new(data)
		current = @root
		parent = nil
		while(current != nil)
			if node < current
				parent = curent
				current = current.left
			elsif node > current
				parent = curent
				current = current.right
			else
				if(node.left == nil and node.right == nil)
					if parent > node
						parent.left = nil
					elsif parent < node
						parent.right = nil
					end
				elsif(node.left == nil or node.right == nil)
					if node.left ==  nil
						if parent > node
							parent.left = current.right
						elsif parent < node
							parent.right = current.right
						end
					elsif node.right == nil
						if parent > node
							parent.left = current.left
						elsif parent < node
							parent.right = current.left
						end
					end
				else
					temp = current
					temp_parent = parent
					temp = temp.right
					while(temp.left != nil)
						temp_parent = temp
						temp = temp.left
					end
					if parent > current
						parent.left = temp
						temp_parent.left = nil
						temp.right = current.right
						current.right = nil
						current.left = nil
					elsif parent < current
						parent.right = temp
						temp_parent.left = nil
						temp.right = current.right
						current.right = nil
						current.left = nil
					end
				end
			end	
		end
	end	
end
end

t = Tree.new()
t.insert(3)

puts t.root()