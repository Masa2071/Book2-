class UsersController < ApplicationController
  before_action :authenticate_user!#ログイン中のユーザーのみ
  def index
    @users = User.all
    @book = Book.new
    @user =  current_user
  end

  def show
    @user = User.find(params[:id])
    @user_book = @user.books
    @book = Book.new #空のインスタンス生成
  end

  def book_params
    params.require(:book).permit(:title, :body)
  end
end
