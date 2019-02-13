require './test/test_helper'

class AuthorTest < Minitest::Test
  def test_it_exists
    nk_jemisin = Author.new({first_name: "N.K.", last_name: "Jemisin"})
    assert_instance_of Author, nk_jemisin
  end

  def test_author_is_inited_with_no_books
    nk_jemisin = Author.new({first_name: "N.K.", last_name: "Jemisin"})
    assert_equal [], nk_jemisin.books
  end

  def test_books_can_be_added_to_authors_books
    nk_jemisin = Author.new({first_name: "N.K.", last_name: "Jemisin"})
    nk_jemisin.add_book("The Fifth Season", "November 3, 2015")
    assert_equal "The Fifth Season", nk_jemisin.books[0].title
    nk_jemisin.add_book("The Hundred Thousand Kingdoms", "2010")
    assert_equal "2010", nk_jemisin.books[1].publication_date
  end
end
