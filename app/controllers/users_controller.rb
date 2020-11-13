class UsersController < ApplicationController

  def show
    @user = User.find(params[:id])
    @book = Book.new #空のインスタンス生成
  end
  
  def book_params
    params.require(:book).permit(:title, :body)
  end
end
