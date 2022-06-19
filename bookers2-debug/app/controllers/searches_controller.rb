class SearchesController < ApplicationController
  before_action :authenticate_user!

  def search
    @search_params = search_params

    case @search_params[:range]
    when "User" then
      @users = User.looks(@search_params[:search], @search_params[:word])
    when "Book" then
      @books = Book.looks(@search_params[:search], @search_params[:word])
    else
    end
  end

  private

  def search_params
    params.permit(:word, :range, :search)
  end

end
