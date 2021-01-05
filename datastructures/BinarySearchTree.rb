class Node

	include Comparable
	attr_accessor :left, :right, :data

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

	attr_accessor :root

	def initialize(array)
		array = array.sort.uniq
		@root = build_tree(array, 0, array.length-1)
	end

	def build_tree(array, s, e)
		if s > e
			return nil
		end
		mid = (s + e)/2
		root = Node.new(array[mid])

		root.left = build_tree(array, s, mid-1)
		root.right = build_tree(array, mid+1, e)

		return root
	end

	def insert(data)
		node = Node.new(data)
		current = @root
		while current
			if node < current
				if current.left
					current.left = node
					current = current.left
				end
				current = current.left
			elsif node > current
				if current.right
					current.right = node
					current = current.right
				end
				current = current.right
			else
				return nil
			end
		end
		current = node
	end

	def delete(root = @root, data)
		if root.nil?
			return root
		end

		if data < root.data
			root.left = delete(root.left, data)
		elsif data > root.data
			root.right = delete(root.right, data)
		else
			if root.left.nil?
				temp = root.right
				root = nil
				return temp
			elsif root.right.nil?
				temp = root.left
				root = nil
				return temp
			end

			current = root.right

			while current.left
				current = current.left
			end

			temp = current
			root.data = temp.data
			root.right = delete(root.right, temp.data)
		end

		return root
	end

	def find(value)
		current = @root
		while current.data != value
			if value > current.data
				current = current.right
			elsif value < current.data
				current = current.left
			end
		end
		return current
	end

	def level_order(root = @root)
		if root.nil?
			return
		end

		queue = []
		results = []

		queue.unshift(root)

		while !queue.empty?
			current = queue[queue.length-1]
			results.append(current.data)
			if current.left
				queue.unshift(current.left)
			end
			if current.right
				queue.unshift(current.right)
			end
			queue.pop()
		end

		return results
	end

	def inorder(root = @root, values = [])
		if root
			inorder(root.left, values)
			values.push(root.data)
			inorder(root.right, values)
		end
		return values
	end

	def preorder(root = @root, values = [])
		if root
			values.push(root.data)
			preorder(root.left, values)
			preorder(root.right, values)
		end
		return values
	end

	def postorder(root = @root, values = [])
		if root
			postorder(root.left, values)
			postorder(root.right, values)
			values.push(root.data)
		end
		return values
	end

	def height(node = @root)
		if node.nil?
			return 0
		end

		l = height(node.left)
		r = height(node.right)

		if l > r
			return l+1
		else
			return r+1
		end
	end

	def getDepth(root, data, level)
		if root.nil?
			return 0
		end

		if root.data == data
			return level
		end

		dLevel = getDepth(root.left, data, level + 1)

		if dLevel != 0
			return dLevel
		end

		dLevel = getDepth(root.right, data, level + 1)

		return dLevel
	end

	def depth(root = @root, data)

		return getDepth(root, data, 1)

	end

	def balanced?(root = @root)
		if root.nil?
			return true
		end

		l = height(root.left)
		r = height(root.right)

		if ((l-r).abs <= 1) and balanced?(root.left) and balanced?(root.right)
			return true
		else
			return false
		end
	end

	def rebalance()
		array = level_order()
		@root = build_tree(array, 0, array.length-1)
	end

	def pretty_print(node = @root, prefix = '', is_left = true)
  	pretty_print(node.right, "#{prefix}#{is_left ? '│   ' : '    '}", false) if node.right
  	puts "#{prefix}#{is_left ? '└── ' : '┌── '}#{node.data}"
  	pretty_print(node.left, "#{prefix}#{is_left ? '    ' : '│   '}", true) if node.left
	end
end

#main function
array = Array.new(15) {rand(1..100)}

tree = Tree.new(array)

puts tree.balanced? # => true

puts tree.level_order()
puts tree.preorder()
puts tree.postorder()
puts tree.inorder()


tree.insert(101)
tree.insert(203)
tree.insert(150)
tree.insert(140)
tree.insert(240)
tree.insert(300)

puts tree.balanced? # => false

tree.rebalance()

puts tree.balanced? # => true

puts tree.level_order()
puts tree.preorder()
puts tree.postorder()
puts tree.inorder()