# frozen_string_literal: true

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

