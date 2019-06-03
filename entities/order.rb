require_relative '../utils/check'
require 'date'

class Order
  attr_reader :book, :reader, :date
  include Errors

  def initialize(book, reader, date = Date.today)
    raise EntityError, "#{date} isn't date!" unless date.is_a? Date

    @book = book
    @reader = reader
    @date = date
  end
end
