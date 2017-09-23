class PubController < ApplicationController
  def index
    @books = Book.all
  end

  def book
    @book = Book.find(params[:id])
  end

  def author
    @author = Person.find(params[:id])
  end

  def search
    render json: Book.all.pluck(:title)
  end

  def find_cart
    session[:cart] ||= Cart.new
  end

  def buy
    find_cart << Book.find(params[:id])
    redirect_to action: :cart
  end

  def cart
    @cart = find_cart
  end
end
