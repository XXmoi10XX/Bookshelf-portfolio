class BooksController < ApplicationController

  def index
    @books = Book.order("number")
    .page(params[:page]).per(15)
  end

 def search
   @books = Book.search(params[:q])
   .page(params[:page]).per(15)

   render "index"
 end


  def show
    @book = Book.find(params[:id])
  end

  def new
    @book = Book.new
  end

  def edit
    @book = Book.find(params[:id])
  end

  def create
    @book = Book.new(book_params)
    if @book.save
      redirect_to @book, notice: "本を登録しました。"
    else
      render "new"
    end
  end

  def update
    @book = Book.find(params[:id])
    @book.assign_attributes(book_params)
    if @book.save
      redirect_to @book, notice: "本情報更新しました"
    else
      render "edit"
    end
    end

  def destroy
    @book = Book.find(params[:id])
    @book.destroy
    redirect_to :books, notice: "会員を削除しました。"
  end

  private def book_params
    params.require(:book).permit(
      :number,
      :title,
      :author,
      :publisher,
      :score
    )
  end

end
