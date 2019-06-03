# frozen_string_literal: true

require_relative 'entities/library.rb'
require 'faker'

library = Library.new

10.times do
  reader = Reader.new(name: Faker::Name.name,
                      email: Faker::Internet.email,
                      city: Faker::Address.city,
                      street: Faker::Address.street_name,
                      house: Faker::Address.building_number.to_i)
  library.add(reader)

  author = Author.new(name: Faker::Book.author,
                      bio: Faker::Date.birthday.to_s)
  library.add(author)

  10.times do
    book = Book.new(title: Faker::Book.title,
                    author: author)
    library.add(book)
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
library.load_data
puts 'Top readers:'
puts library.top_readers.to_s
puts 'Top books:'
puts library.top_books.to_s
puts 'Number readers of top books:'
puts library.number_reader_top_books(4)
