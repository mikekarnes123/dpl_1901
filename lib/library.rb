class Library
  attr_reader :collection
  def initialize
    @collection = []
  end

  def add_to_collection(book)
    @collection << book
  end

  def include?(name)
    @collection.any?{|book| book.title == name}
  end

  def card_catalogue
    @collection.sort_by do |book|
      book.author_last_name
    end.reverse
  end

  def find_by_author(author)
    books_by_author = {}
    books = @collection.select do |book|
      book.author_first_name + " " + book.author_last_name == author
    end
    books.each do |book|
      books_by_author[:"#{book.title}"] = book
    end
    books_by_author
  end

  def find_by_publication_date(date)
    books_by_pub_date = {}
    books = @collection.select do |book|
      book.publication_date.include?(date)
    end
    books.each do |book|
      books_by_pub_date[:"#{book.title}"] = book
    end
    books_by_pub_date
  end
end
