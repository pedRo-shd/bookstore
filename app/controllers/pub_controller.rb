class PubController < ApplicationController
  before_action :set_book, only: [:book, :buy]

  def index
    @books = Book.page(params[:page]).per(3)
  end

  def book
  end

  def author
    @author = Person.find(params[:id])
  end

  def buy
  raise NotAuthenticated, 'Faça o login primeiro' if session[:id].blank?
  @order = Order.create_by_cart(session[:id], @book)

  if @order.blank?
    flash[:notice] = 'Não foi possível criar o seu pedido!'
    redirect_to root_path
    return
  end
    redirect_to order_path(@order)
  end

  def order
    @order = Order.find(params[:id])
  end

  def find_cart
    session[:cart] ||= Cart.new
  end

  def search
    @books = Book.search(params[:term])
  end

  private

  def set_book
    @book = Book.find(params[:id])
  end
end
