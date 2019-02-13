class Book

  def initialize(book_info)
    @book_info = book_info

  end

  def author_first_name
    @book_info[:first_name]
  end

  def author_last_name
    @book_info[:last_name]
  end

  def title
    @book_info[:title]
  end

  def publication_date
    @book_info[:publication_date]
  end
end
