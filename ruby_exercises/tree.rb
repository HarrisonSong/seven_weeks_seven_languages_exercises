class Tree
	attr_accessor :children, :node_name

	def initialize(name, children={})
		@children = []
		children.each do |key, value|
			@children.push(Tree.new(key, value))
		end
		@node_name = name
	end 

	def visit_all(&block)
		visit &block
		children.each {|c| c.visit_all &block} 
	end

	def visit(&block)
		block.call self
	end
end