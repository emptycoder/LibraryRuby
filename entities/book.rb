require_relative '../utils/check'
# frozen_string_literal: true

# Class that describes book object
class Book
  attr_reader :title, :author
  include Check

  def initialize(title, author)
    empty?(title, author)

    @title = title
    @author = author
  end
end
