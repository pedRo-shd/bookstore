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

  def remove
    @book = Book.find(params[:id])
    @cart = find_cart
    @cart - @book
    redirect_to cart_path
  end

  def change
    @book = Book.find(params[:id])
    @cart = find_cart
    @cart.change(@book, params[:qty].to_i)
  end

  def close_order
  raise NotAuthenticated, 'Faça o login primeiro' if session[:id].blank?
  @cart = find_cart
  @order = Order.create_by_cart(session[:id], @cart.items)

  if @order.blank?
    flash[:notice] = 'Não foi possível criar o seu pedido!'
    redirect_to root_path
    return
  end
    @cart.clear
    redirect_to order_path(@order)
  end

  def order
    @order = Order.find(params[:id])
  end
end
