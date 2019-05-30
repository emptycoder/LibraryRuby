require_relative '../utils/check'
# frozen_string_literal: true

# Class that describes author object
class Author
  attr_reader :name, :bio
  include Check

  def initialize(name, bio)
    empty?(name)

    @name = name
    @bio = bio
  end

  def to_s
    "#{@name} #{bio}"
  end
end
