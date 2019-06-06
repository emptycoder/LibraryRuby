class Generator
  def self.generate(library)
    10.times do
      library.add(generate_reader)
      library.add(generate_author)
      10.times do
        library.add(generate_book)
        library.add_order(@book, @reader) if Faker::Number.between(0, 1) == 1
      end
    end
  end

  def self.generate_reader
    @reader = Reader.new(name: Faker::Name.name,
                         email: Faker::Internet.email,
                         city: Faker::Address.city,
                         street: Faker::Address.street_name,
                         house: Faker::Address.building_number.to_i)
  end

  def self.generate_author
    @author = Author.new(name: Faker::Book.author,
                         bio: Faker::Date.birthday.to_s)
  end

  def self.generate_book
    @book = Book.new(title: Faker::Book.title,
                     author: @author)
  end
end
