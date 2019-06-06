# frozen_string_literal: true

require_relative 'entities/library'
require_relative 'generator'
require 'faker'

PATH = './database/import.yml'

library = Library.new

Generator.generate(library)

Data.save(PATH, library)
library = Data.load(PATH)
puts 'Top readers:'
puts library.top_readers.to_s
puts 'Top books:'
puts library.top_books.to_s
puts 'Number readers of top books:'
puts library.number_reader_top_books(4)
