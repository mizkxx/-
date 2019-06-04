class BooksController < ApplicationController
 	def new
	end

	def index
		@post_books = PostBook.all
    	@post_book = PostBook.new
	end

	def show
		@post_book = PostBook.find(params[:id])
	end

  def create
        # ストロングパラメーターを使用
    post_book = PostBook.new(book_params)#@がないとローカル変数
      if book.save
        flash[:notice] = "Book was successfully created."
      else
        flash[:danger] = 'mistake'
      end
    redirect_to post_book
  end

  def update
    post_book = PostBook.find(params[:id])
    if book.update(book_params)
        flash[:notice] = "Book was successfully updated."
      else#これないとミスる
        flash[:danger] = 'mistake'
      end
    redirect_to post_book
  end

  def destroy
  	@post_book = PostBook.find(params[:id])#データ(レコード)を1件取得
    @post_book.destroy#レコードをDBから削除
    redirect_to post_books_path#post一覧画面へリダイレクト
  end

   private
  def post_book_params
    params.require(:book).permit(:title, :body)
  end
end
