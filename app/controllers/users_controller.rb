class UsersController < ApplicationController
   before_action :correct_user,   only: [:edit, :update]

  def index
    @users = User.all
    @book = Book.new
    @books = Book.all
  end

  def show
    @user = User.find_by(id: params[:id])
    @book = Book.new
    @books = Book.where(user_id: params[:id])
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      flash[:notice] = "You have updated user successfully."
      redirect_to '/users'
    else
      render template: "users/#{@user.id}/edit"
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, %i(profile_image), :introduction)
  end

  def correct_user
    @user = User.find(params[:id])
    redirect_to user_path(current_user.id) unless current_user?(@user)
  end

end
