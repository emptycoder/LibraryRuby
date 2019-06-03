require_relative '../requires'

class Library
  attr_reader :authors, :readers, :orders
  attr_writer :PATH

  def initialize
    @authors = {}
    @readers = []
    @orders = []
    @PATH = './import.yml'
  end

  def add_book(book)
    raise EntityError, "#{book.class} isn't book!" unless book.is_a? Book

    @authors[book.author] << book
  end

  def add_author(author)
    raise EntityError, "#{author.class} isn't author!" unless author.is_a? Author

    @authors[author] = [] unless @authors.include?(author)
  end

  def add_reader(reader)
    raise EntityError, "#{reader.class} isn't reader!" unless reader.is_a? Reader

    @readers.push(reader)
  end

  def add_order(book, reader)
    raise EntityError, "#{book.class} is not class Book" unless book.is_a? Book
    raise EntityError, "#{reader.class} is not class Reader" unless reader.is_a? Reader

    @orders.push(Order.new(book, reader))
  end

  def save_data
    Data.save(@PATH, @authors, @readers, @orders)
  end

  def load_data
    Data.load(@PATH)
  end

  def top_readers(quantity = 1)
    top_order.keys.map(&:reader).last(quantity)
  end

  def top_books(quantity = 1)
    top_order.keys.map(&:book).last(quantity)
  end

  def top_order
    rating = Hash.new(0)

    @orders.each { |order| rating.store(order, rating[order] + 1) }
    rating.sort_by { |_order, count| count }
    rating
  end

  def number_reader_top_books(quantity = 3)
    books = top_books(quantity)

    @orders.select { |order| books.include? order.book }.uniq(&:reader).size
  end
end
