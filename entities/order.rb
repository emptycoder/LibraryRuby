require_relative '../utils/check'
require 'date'
# frozen_string_literal: true

# Class that describes order object
class Order
  attr_reader :book, :reader, :date
  include Check

  def initialize(book, reader, date = Date.today)
    raise EntityError, "#{date} isn't date!" unless date.is_a? Date

    @book = book
    @reader = reader
    @date = date
  end
end
