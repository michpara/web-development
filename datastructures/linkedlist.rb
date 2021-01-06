class Node
	attr_accessor :next
	attr_reader :value

	def initialize(value)
		@value = value
		@next = nil
	end
end

class LinkedList
	def initialize()
		@head = nil
		@tail = nil
	end

	def append(value)
		node = Node.new(value)
		
		if @head == nil
			@head = node
			@tail = @head
		else
			current = @head
			while(current != nil)
				if (current.next == nil)
					current.next = node
					@tail = node
					break
				end
				current = current.next
			end
		end
	end

	def prepend(value)
		node = Node.new(value)
		if @head == nil
			@head = node
			@tail = @head
		else
			node.next = @head
			@head = node
		end
	end

	def size()
		current = @head
		size = 0
		while(current != nil)
			size += 1
			current = current.next
		end
		return size
	end

	def head()
		return @head
	end

	def tail()
		return @tail
	end

	def at(ind)
		current = @head
		i = 0
		while(i < ind && current != nil)
			current = current.next
			i += 1
		end
		return current 
	end

	def pop()
		if(@head.next == nil or @head == nil)
			@head = nil
			@tail = nil
			return nil
		end
		current = @head
		prev = nil
		while(current.next != nil)
			prev = current
			current = current.next
		end
		temp = current
		@tail = prev
		@tail.next = nil
		return temp
	end

	def contains?(value)
		current = @head
		while(current != nil)
			if current.value == value
				return true
			end
			current = current.next
		end
		return false
	end

	def find(value)
		current = @head
		i = 0
		while(current != nil)
			if current.value == value
				return i
			end
			current = current.next
			i += 1
		end
		return nil
	end

	def to_s()
		current = @head
		while(current != nil)
			print "( " + current.value.to_s + " ) -> "
			current = current.next
		end
		print "nil"
	end
end