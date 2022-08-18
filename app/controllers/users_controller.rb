class UsersController < ApplicationController

  def index
    @book = Book.new
    @books = Book.all
  end

  def show
    @book = Book.new
    @books = Book.all
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    @user.update(user_params)
    redirect_to '/users'
  end

  private

  def user_params
    params.require(:user).permit(:name,:image,:introduction)
  end

end
