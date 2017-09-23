class PubController < ApplicationController
  def index
    @books = Book.all
  end

  def book
    @book = Book.find(params[:id])
  end
end
