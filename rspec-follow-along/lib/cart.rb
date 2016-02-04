class Cart
	extend Forwardable
	def_delegator :@items, :empty?

	def initialize
		@items = {}
	end
	# def empty?
	# 	@items.empty?
	# end
	def value
    total = 0
    @items.each do |item, quantity|
      total += item[:value] * quantity
    end
    total
  end

  def add(item)
    unless (@items.has_key? item)
      @items[item] = 0
    end
    @items[item] += 1
  end

  def unique_items_count
    @items.keys.size
  end
end

