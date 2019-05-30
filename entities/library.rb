require_relative '../requires'
# frozen_string_literal: true

# Class that allow you to work with library
class Library
  attr_reader :authors, :readers, :orders
  attr_writer :path

  def initialize
    @authors = {}
    @readers = []
    @orders = []
    @path = './import.yml'
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

  def save_data()
    Data.save(@path, @authors, @readers, @orders)
  end

  def load_data()
    Data.load(@path)
  end

  def top_readers(quantity = 1)
    top_order.keys.map(&:reader)[1..quantity]
  end

  def top_books(quantity = 1)
    top_order.keys.map(&:book)[1..quantity]
  end

  def top_order()
    rating = Hash.new(0)

    @orders.each { |order| rating.store(order, rating[order] + 1) }
    rating.sort_by { |_order, count| count }
    rating
  end

  def number_reader_top_books(quantity = 3)
    books = top_books(quantity)

    selected_users = @orders.select { |order| books.include? order.book }
    selected_users.uniq!(&:reader)
    selected_users.size
  end

  def fill_test_data()
    10.times do
      reader = Reader.new(Faker::Name.name,
                          Faker::Internet.email,
                          Faker::Address.city,
                          Faker::Address.street_name,
                          Faker::Address.building_number.to_i)
      add_reader(reader)

      author = Author.new(Faker::Book.author,
                          Faker::Date.birthday.to_s)
      add_author(author)

      10.times do
        book = Book.new(Faker::Book.title, author)
        add_book(book)
      end
    end

    @readers.each do |reader|
      @authors.each_value do |books|
        books.each do |book|
          add_order(book, reader) if Faker::Number.between(1, 100) < 30
        end
      end
    end
  end
end
