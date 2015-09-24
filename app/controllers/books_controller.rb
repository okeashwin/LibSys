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
    if session[:role] == 1
      render 'admin_show_view'
    else
      render 'member_show_view'
    end
  end

  # GET /books/new
  def new
    @book = Book.new
  end

  # GET /books/1/edit
  def edit
    logger.debug "Into books#edit : Received this id : #{params[:id]}"
    @book = Book.find(params[:id])
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
    @book = Book.find(params[:id])
    if @book.update(book_params)
      redirect_to @book, notice: 'Book was successfully updated.'
    else
      flash[:notice] = "There was an error in updating the book details"
      render :edit
    end
  end

  # DELETE /books/1
  def destroy
    @book = Book.find(params[:id])
    # See if there are any active reservations
    reservations = Reservation.where('book_id = ?', @book.id)
    if reservations[0]
      flash[:notice] = "There are active check-outs for this book"
    else
      @book.destroy
      flash[:notice] = " Book : #{@book.name} successfully deleted"
    end
    redirect_to action: 'index'
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
        flash[:notice] = "Book titled #{book.name} successfully checked out"
      else
        flash[:notice] = "There was an error in checking out the book requested."
      end
    else
      flash[:notice] = "The book is not available in the library. It is already checked out."
    end

    # Redirect back to the book catalog
    redirect_to action: 'index'
  end

  def admin_reserve_initiate
    logger.debug "Into admin_reserve_initiate: params hash : #{params.inspect}"
    flash[:book_id] = params[:id]
    redirect_to action: 'prompt_user_id'
  end

  # A stub for "on behalf" form
  def prompt_user_id
  end

  def admin_reserve
    puts params[:id]
    puts params[:email]
    users = User.where('email = ?', params[:email])
    book = Book.find(params[:id])
    if users[0]
      if users[0].role & User::IS_MEMBER > 0
        # We can go ahead with the reservation
        if book.status == 'available'
          reservation = Reservation.new(user_id: users[0].id, book_id: book.id, dateIssued: Time.now.getutc);
          if reservation.save(validate: true)
            book.update(:status => :checkedOut)
            flash[:notice] = "Book #{book.name} successfully checked out to #{users[0].name}."
          else
            flash[:notice] = "There was an error in checking out the book requested."
          end
        else
          flash[:notice] = "The book is not available in the library. It is already checked out."
        end
      else
        flash[:notice] = "User is not a valid library member"
      end
    else
      flash[:notice] = "Member does not exist"
    end
    redirect_to action:'index'
  end

  def search_form
    @book = Book.new
  end

  def search
    puts params[:status]
    if params[:status]=='Available'
      status = 0
    else
      status = 1
    end
    @books = Book.where("(name LIKE ? OR authors LIKE ? OR description LIKE ? OR isbn LIKE ?) AND status=?","%#{params[:name]}%", "%#{params[:authors]}%", "%#{params[:description]}%", "%#{params[:isbn]}%", status)
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

  def not_authorized

  end

  private

    # Only allow a trusted parameter "white list" through.
    def book_params
      params.require(:book).permit(:name, :isbn, :authors, :description)
    end

    def user_signed_in
      session[:email] != nil
    end
end
