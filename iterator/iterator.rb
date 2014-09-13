class Book
  def initialize(name)
    @name = name
  end
  attr_reader :name
end

class BookShelf

  def initialize
    @books = []
  end

  def apend_book_at(book)
    @books << book
  end

  def get_book_at(index)
   @books[index]
  end

  def get_length
   @books.length
  end

  def iterator
    BookShelfIterator.new(self)
  end
end

class BookShelfIterator

  def initialize(book_shelf)
    @book_shelf = book_shelf
    @index = 0
  end

  def has_next?
    @index < @book_shelf.get_length
  end

  def next
    book = has_next? ? @book_shelf.get_book_at(@index) : nil
    @index = @index + 1
    book
  end

end

book_shelf = BookShelf.new
book_shelf.apend_book_at(Book.new("Around the World in 80 Days"))
book_shelf.apend_book_at(Book.new("Bible"))
book_shelf.apend_book_at(Book.new("Cinderella"))
book_shelf.apend_book_at(Book.new("Daddy-Long-Legs"))
iterator = book_shelf.iterator

while(iterator.has_next?)
    book = iterator.next
    puts book.name
end

