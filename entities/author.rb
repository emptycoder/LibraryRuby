require_relative '../utils/check'

class Author
  attr_reader :name, :bio
  include Errors

  def initialize(name, bio)
    empty?(name)

    @name = name
    @bio = bio
  end

  def to_s
    "#{@name} #{bio}"
  end
end
