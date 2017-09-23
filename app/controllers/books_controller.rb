class BooksController < ApplicationController
  before_action :set_book, only: [:show, :edit, :update, :destroy]
  before_action :load_categories, only: [:new, :edit, :create, :update]

  after_action :save_image, only: [:create, :update]

  def index
    @books = Book.all
  end

  def show
  end

  def new
    @book = Book.new
  end

  def edit
  end

  def create
    @book = Book.new(book_params)

    respond_to do |format|
      if @book.save
        format.html { redirect_to @book, notice: 'Book was successfully created.' }
        format.json { render :show, status: :created, location: @book }
      else
        format.html { render :new }
        format.json { render json: @book.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @book.update(book_params)
        format.html { redirect_to @book, notice: 'Book was successfully updated.' }
        format.json { render :show, status: :ok, location: @book }
      else
        format.html { render :edit }
        format.json { render json: @book.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @book.destroy
    respond_to do |format|
      format.html { redirect_to books_url, notice: 'Book was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  def save_image
    return if !params[:data_stream]
    @image = @book.image ? @book.image : Image.new(title: @book.title,
                                                   imageable_id: @book.id,
                                                   imageable_type: controller_name.singularize.camelize)
    @image.data_stream = params[:data_stream]
    @image.height = 200
    @image.save
  end

  def load_categories
    @categories = Category.all
  end

  def set_book
    @book = Book.find(params[:id])
  end

  def book_params
    params.require(:book).permit(:title, :published_at, :text, :value,
                                  :person_id, :data_stream, category_ids: [])
  end
end
