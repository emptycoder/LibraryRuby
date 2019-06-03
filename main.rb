# frozen_string_literal: true

require_relative 'entities/library.rb'
require 'faker'

library = Library.new

10.times do
  reader = Reader.new(Faker::Name.name,
                      Faker::Internet.email,
                      Faker::Address.city,
                      Faker::Address.street_name,
                      Faker::Address.building_number.to_i)
  library.add_reader(reader)

  author = Author.new(Faker::Book.author,
                      Faker::Date.birthday.to_s)
  library.add_author(author)

  10.times do
    book = Book.new(Faker::Book.title, author)
    library.add_book(book)
  end
end

library.readers.each do |reader|
  library.authors.each_value do |books|
    books.each do |book|
      library.add_order(book, reader) if Faker::Number.between(1, 100) < 30
    end
  end
end

library.save_data
library.PATH = './import.yml'
library.load_data
puts 'Top readers:'
puts library.top_readers.to_s
puts 'Top books:'
puts library.top_books.to_s
puts 'Number readers of top books:'
puts library.number_reader_top_books(4)
