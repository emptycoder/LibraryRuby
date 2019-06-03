require_relative '../utils/check'

class Reader
  attr_reader :name, :email, :city, :street, :house
  include Errors

  def initialize(name:, email:, city:, street:, house:)
    empty?(name, email, city, street)
    string?(name, email, city, street)
    integer?(house)
    positive?(house)

    @name = name
    @email = email
    @city = city
    @street = street
    @house = house
  end
end
