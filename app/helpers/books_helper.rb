module BooksHelper
  def authors_names(book)
    book.authors.map(&:full_name).join(', ')
  end
end
