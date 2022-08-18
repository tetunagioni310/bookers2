class BooksController < ApplicationController

 def create
    @book = Book.new(book_params)
    if @book.save
      flash[:notice] = "successfully"
      redirect_to book_path(@book.id)
    else
      @books = Book.all
      render 'index'
    end
  end

  def destroy
  end

  def index
    @book = Book.new
    @books = Book.all
  end

  def show
    @book = Book.new
    @books = Book.werer(params[:id])
  end

  def edit
  end

  def update
  end

  private

  def book_params
    params.require(:book).permit(:title,:body)
  end
end
