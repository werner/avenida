# frozen_string_literal: true

# class created to check if an item is blank, then we proceed,
# or if it's a mine
class Item
  attr_accessor :value

  def initialize(value)
    @value = value
  end

  def blank?
    @value == ' '
  end

  def mine?
    @value == '*'
  end
end
