require_relative '../utils/check'

class Book
  attr_reader :title, :author
  include Errors

  def initialize(title, author)
    empty?(title, author)

    @title = title
    @author = author
  end
end
