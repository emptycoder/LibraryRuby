module Statistics
  def top_readers(quantity = 1)
    top_orders.keys.map(&:reader).last(quantity)
  end

  def top_books(quantity = 1)
    top_orders.keys.map(&:book).last(quantity)
  end

  def top_orders
    rating = Hash.new(0)

    @orders.each { |order| rating.store(order, rating[order] + 1) }
    rating.sort_by { |_order, count| count }.to_h
  end

  def number_reader_top_books(quantity = 3)
    books = top_books(quantity)

    @orders.select { |order| books.include? order.book }.uniq(&:reader).size
  end
end
