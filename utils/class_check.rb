# frozen_string_literal: true

# Class that describe entity errors
class EntityError < StandardError
  def initialize
    puts "Entity error!"
  end
end
