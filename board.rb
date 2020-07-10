# frozen_string_literal: true

class Board
  attr_accessor :rows
  def initialize(rows)
    @rows = rows.map{|row| Row.new(row)}
  end
  def solve
    @rows.each_with_index.map do |row, index|
      if index.zero?
        row.map(&:value)
      else
        row.map_with_index do |item, sub_index|
          if item.blank?
            item.value = 0
            item.value = row.siblings_mines(sub_index)
            item.value += @rows[index - 1].siblings_mines(sub_index)
            item.value += @rows[index + 1].siblings_mines(sub_index)
          end
          item.value.to_s
        end
      end
    end
  end
end

