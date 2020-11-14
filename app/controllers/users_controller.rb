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

  def edit
    @user = User.find(params[:id])
  end
  
  def update
    @user = User.find(params[:id]) 
    @user.update(user_params)
    redirect_to user_path()
  end

  def user_params
    params.require(:user).permit(:name, :introduction)
  end
end
