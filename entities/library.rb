require_relative '../requires'

class Library
  attr_reader :authors, :readers, :orders, :books
  include Statistics

  def initialize
    @authors = []
    @books = []
    @readers = []
    @orders = []
  end

  def add(entity)
    case entity
    when Book
      @books.push(entity)
    when Author
      @authors.push(entity)
    when Reader
      @readers.push(entity)
    else raise EntityError
    end
  end

  def add_order(book, reader)
    raise EntityError, "#{book.class} is not class Book" unless book.is_a? Book
    raise EntityError, "#{reader.class} is not class Reader" unless reader.is_a? Reader

    @orders.push(Order.new(book, reader))
  end
end
