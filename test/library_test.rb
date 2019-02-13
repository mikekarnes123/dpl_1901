require './test/test_helper'

class LibraryTest < Minitest::Test
  def test_it_exists
    dpl = Library.new
    assert_instance_of Library, dpl
  end

  def test_library_is_inited_with_no_books
    dpl = Library.new
    assert_equal [], dpl.collection
  end

  def test_books_can_be_added_to_collection
    dpl = Library.new
    nk_jemisin = Author.new({first_name: "N.K.", last_name: "Jemisin"})
    fifth_season = nk_jemisin.add_book("The Fifth Season", "November 3, 2015")
    kingdoms = nk_jemisin.add_book("The Hundred Thousand Kingdoms", "2010")
    harper_lee  = Author.new({first_name: "Harper", last_name: "Lee"})
    mockingbird = harper_lee.add_book("To Kill a Mockingbird", "July 11, 1960")
    dpl.add_to_collection(fifth_season)
    assert_equal "The Fifth Season", dpl.collection[0].title
    dpl.add_to_collection(mockingbird)
    assert_equal "To Kill a Mockingbird", dpl.collection[1].title
    dpl.add_to_collection(kingdoms)
    assert_equal "The Hundred Thousand Kingdoms", dpl.collection[2].title
  end

  def test_can_search_library_for_books
    dpl = Library.new
    nk_jemisin = Author.new({first_name: "N.K.", last_name: "Jemisin"})
    fifth_season = nk_jemisin.add_book("The Fifth Season", "November 3, 2015")
    kingdoms = nk_jemisin.add_book("The Hundred Thousand Kingdoms", "2010")
    harper_lee  = Author.new({first_name: "Harper", last_name: "Lee"})
    mockingbird = harper_lee.add_book("To Kill a Mockingbird", "July 11, 1960")
    dpl.add_to_collection(fifth_season)
    dpl.add_to_collection(mockingbird)
    dpl.add_to_collection(kingdoms)
    assert_equal true, dpl.include?("To Kill a Mockingbird")
    assert_equal false, dpl.include?("A Connecticut Yankee in King Arthur's Court")
  end

  def test_its_can_org_books_in_alphabetical_order_by_authors_last_name
    dpl = Library.new
    nk_jemisin = Author.new({first_name: "N.K.", last_name: "Jemisin"})
    fifth_season = nk_jemisin.add_book("The Fifth Season", "November 3, 2015")
    kingdoms = nk_jemisin.add_book("The Hundred Thousand Kingdoms", "2010")
    harper_lee  = Author.new({first_name: "Harper", last_name: "Lee"})
    mockingbird = harper_lee.add_book("To Kill a Mockingbird", "July 11, 1960")
    dpl.add_to_collection(fifth_season)
    dpl.add_to_collection(mockingbird)
    dpl.add_to_collection(kingdoms)
    assert_equal [mockingbird, kingdoms, fifth_season], dpl.card_catalogue
  end

  def test_its_can_find_books_by_author
    dpl = Library.new
    nk_jemisin = Author.new({first_name: "N.K.", last_name: "Jemisin"})
    fifth_season = nk_jemisin.add_book("The Fifth Season", "November 3, 2015")
    kingdoms = nk_jemisin.add_book("The Hundred Thousand Kingdoms", "2010")
    harper_lee  = Author.new({first_name: "Harper", last_name: "Lee"})
    mockingbird = harper_lee.add_book("To Kill a Mockingbird", "July 11, 1960")
    dpl.add_to_collection(fifth_season)
    dpl.add_to_collection(mockingbird)
    dpl.add_to_collection(kingdoms)
    assert_equal ({"To Kill a Mockingbird": mockingbird}), dpl.find_by_author("Harper Lee")
  end

  def test_its_can_find_books_by_pub_date
    dpl = Library.new
    nk_jemisin = Author.new({first_name: "N.K.", last_name: "Jemisin"})
    fifth_season = nk_jemisin.add_book("The Fifth Season", "November 3, 2015")
    kingdoms = nk_jemisin.add_book("The Hundred Thousand Kingdoms", "2010")
    harper_lee  = Author.new({first_name: "Harper", last_name: "Lee"})
    mockingbird = harper_lee.add_book("To Kill a Mockingbird", "July 11, 1960")
    dpl.add_to_collection(fifth_season)
    dpl.add_to_collection(mockingbird)
    dpl.add_to_collection(kingdoms)
    assert_equal ({"To Kill a Mockingbird": mockingbird}), dpl.find_by_publication_date("1960")
  end
end
