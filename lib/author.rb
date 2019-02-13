class Author
  attr_reader :books
  def initialize(author_info)
    @author_info = author_info
    @books = []
  end

  def add_book(title, publication_date)
    @books << new_book = Book.new({first_name: @author_info[:first_name],
                       last_name: @author_info[:last_name],
                       title: title,
                       publication_date: publication_date})
    new_book
  end
end
