class BooksController < ApplicationController

    def index
        @books = Book.all
        render json: @books
    end

    def show
        @book = Book.find(params[:id])
        render json: @book
    end

    def new
        @book = Book.new
    end

    def create
        @book = Book.new(book_params)
        if @book.save
            redirect_to books_path
        else
            render :new
        end
    end

    def destroy
        @book = Book.find(params[:id])
        @book.destroy
    end

    private
    def book_params
        params.require(:book).permit(:title, :author, :total_pages, :daily_pages_reading, :description, :image, :category)
    end
end
