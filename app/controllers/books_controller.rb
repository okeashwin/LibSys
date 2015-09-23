class BooksController < ApplicationController

  # GET /books
  def index
    @books = Book.all
    # Admin
    if session[:role] == 1
      render 'admin_book_catalog'
    else
      render 'members_book_catalog'
    end
  end

  # GET /books/1
  def show
    @book = Book.find(params[:id])
  end

  # GET /books/new
  def new
    @book = Book.new
  end

  # GET /books/1/edit
  def edit
    redirect_to action: 'index'
  end

  # POST /books
  def create
    @book = Book.new(book_params)

    if @book.save
      redirect_to @book, notice: 'Book was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /books/1
  def update
    if @book.update(book_params)
      redirect_to @book, notice: 'Book was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /books/1
  def destroy
    @book.destroy
    redirect_to books_url, notice: 'Book was successfully destroyed.'
  end

  # New methods
  def reserve
    logger.debug "Into reserve"
    book = Book.find(params[:id])
    user = User.where('email = ?', session[:email])
    puts book.status
    if book.status == 'available'
      reservation = Reservation.new(user_id: user[0].id, book_id: book.id, dateIssued: Time.now.getutc);
      if reservation.save(validate: true)
        book.update(:status => :checkedOut)
        flash[:notice] = "Book #{book.name} successfully checked out."
      else
        flash[:notice] = "There was an error in checking out the book requested."
      end
    else
      flash[:notice] = "The book is not available in the library. It is already checked out."
    end

    # Redirect back to the book catalog
    redirect_to action: 'index'
  end

  def search_form
    @book = Book.new
  end

  def search
    # puts params[:book].inspect
    if params[:status]=='Available'
      status = 0
    else
      status = 1
    end
    @books = Book.where("name LIKE ? OR authors LIKE ? OR description LIKE ? OR isbn LIKE ? AND status=?","%#{params[:name]}%", "%#{params[:authors]}%", "%#{params[:description]}%", "%#{params[:isbn]}%", status)
  end

  def add_new_book_form
    @book = Book.new
  end

  def add_new_book
    puts "In add_new_book"
    input = book_params
    @book = Book.new(name: input[:name], authors: input[:authors], description: input[:description], isbn: input[:isbn], status: :available)
    if @book.save
      flash[:notice] = "Book : #{@book.name} is successfully added"
    else
      flash[:notice] = "There was an error in adding the book to the catalog."
    end
    redirect_to action: 'index'
  end

  private

    # Only allow a trusted parameter "white list" through.
    def book_params
      params.require(:book).permit(:name, :isbn, :authors, :description)
    end
end
