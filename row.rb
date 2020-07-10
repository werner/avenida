# frozen_string_literal: true

class Row
  attr_accessor :items
  def initialize(items)
    @items = items.map{|item| Item.new(item)}
  end
  def map_with_index
    @items.each_with_index.map {|item, index| yield(item, index) }
  end
  def [](value)
    @items[value]
  end
  def map
    @items.map {|item| yield item }
  end
  def siblings_mines(index)
    [@items[index], @items[index + 1], @items[index - 1]].count(&:mine?)
  end
end


