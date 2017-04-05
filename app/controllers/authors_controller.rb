class AuthorsController < ApplicationController
  before_action :set_book
  before_action :set_book_author, only: [:show, :update, :destroy]

  # GET /books/:book_id/authors
  def index
    json_response(@book.authors)
  end

  # GET /books/:book_id/authors/:id
  def show
    json_response(@author)
  end

  # POST /books/:book_id/authors
  def create
    @book.authors.create!(author_params)
    json_response(@book, :created)
  end

  # PUT /books/:book_id/authors/:id
  def update
    @author.update(author_params)
    head :no_content
  end

  # DELETE /books/:book_id/authors/:id
  def destroy
    @author.destroy
    head :no_content
  end

  private

  def author_params
    params.permit(:name)
  end

  def set_book
    @book = Book.find(params[:book_id])
  end

  def set_book_author
    @author = @book.authors.find_by!(id: params[:id]) if @book
  end
end