require 'test_helper'

class BooksControllerTest < ActionController::TestCase
  setup do
    @book = Book.new(name: "Book001", isbn: "978-3-16-148410-0-20", authors: "Author1", description: "description", status: :available, isDeleted: FALSE)
    @sample_book = books(:one)
    @superadmin = users(:three)
    @book_suggestion = book_suggestions(:one)
    session[:email] = @superadmin.email
    session[:role] = @superadmin.role
  end

  test "should get index" do
    get :index
    assert_response :success
  end

  test "should get add_new_book_form" do
    get :add_new_book_form
    assert_response :success
  end

  test "should get search_form" do
    get :search_form
    assert_response :success
  end

  test "should create book" do
    assert_difference('Book.count') do
      post :add_new_book, book: {name: @book.name, isbn: @book.isbn, authors: @book.authors, description: @book.description, status: @book.status, isDeleted: @book.isDeleted}
    end
  end

  test "should show book" do
    get :show, id: @sample_book
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @sample_book
    assert_response :success
  end

  test "should update book" do
    patch :update, id: @sample_book, book: { name: "Introduction to C Programming" }
    book = Book.find(@sample_book.id)
    assert_equal "Introduction to C Programming", book.name
    assert_redirected_to book_path(assigns(:book))
  end

  test "should destroy book" do
    assert_equal FALSE, @sample_book.isDeleted
    delete :destroy, id: @sample_book
    book = Book.find(@sample_book.id)
    assert_equal TRUE, book.isDeleted

    assert_redirected_to books_path
  end

  test "should reserve" do
    assert_equal 'available', @sample_book.status
    assert_difference('Reservation.count') do
      post :reserve, id: @sample_book.id
    end
    book = Book.find(@sample_book.id)
    assert_equal 'checkedOut', book.status
  end

  test "cannot reserve a checked-out book" do
    book = Book.new(name: "Book001", isbn: "978-3-16-148410-0-100", authors: "Author2", description: "description2", status: :checkedOut, isDeleted: FALSE)
    book.save
    assert_no_difference('Reservation.count') do
      post :reserve, id: book.id
    end
  end

  test "should get suggestions-index" do
    get :suggestions_index
    assert_response :success
  end

  test "render book suggestions form" do
    get :suggest_new_book_form
    assert_response :success
  end

  test "should add a new suggestion book" do
    book = Book.new(name: "C++", isbn: "978-3-16-148410-0-200", authors: "Author2", description: "description2")
    assert_difference('BookSuggestion.count') do
      post :suggest_new_book, book: {name: book.name, isbn: book.isbn, authors: book.authors, description: book.description}
    end
  end

  test "suggestion should get added to catalog" do
    assert_difference('Book.count') do
      post :add_to_catalog, to_be_added: @book_suggestion.id
    end
  end

  test "suggestion should be deleted from 'suggestions' relation after getting added to catalog" do
    assert_difference('BookSuggestion.count',-1) do
      post :add_to_catalog, to_be_added: @book_suggestion.id
    end
  end
end
