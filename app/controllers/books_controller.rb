class BooksController < ApplicationController
 def new
  	  # Viewへ渡すためのインスタンス変数に空のモデルオブジェクトを生成する。
        @book = Book.new
  end

 # 以下を追加
    def create
        # ストロングパラメーターを使用
         @book = Book.new(book_params)
        # DBへ保存する
         if @book.save 
        # トップ画面へリダイレクト
        flash[:notice] = "Book was successfully updated.

"
        redirect_to "/books/#{@book.id}"

        else
       @books = Book.all
       render "index"
       end
    end

    def show
    	@book = Book.find(params[:id])
    end



    def edit
        @book = Book.find(params[:id])
    end


    def update
        book = Book.find(params[:id])
        book.update(book_params)
        flash[:notice] = "Book was successfully updated.

"
        redirect_to "/books/#{book.id}"


    end






    def index
      @book = Book.new
      @books = Book.all
    end


     def destroy
       book = Book.find(params[:id])
        book.destroy
        redirect_to books_path
     end



    private

    def book_params
        params.require(:book).permit(:title, :body)
    end

end
