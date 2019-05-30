# frozen_string_literal: true

require_relative 'entities/library.rb'
require 'faker'

library = Library.new

library.fill_test_data
library.save_data
library.path = './import.yml'
library.load_data
puts 'Top readers:'
puts library.top_readers.to_s
puts 'Top books:'
puts library.top_books.to_s
puts 'Number readers of top books:'
puts library.number_reader_top_books(4)
