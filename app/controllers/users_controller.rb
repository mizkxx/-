class UsersController < ApplicationController
	def show
    	#@user = User.find_by(params[:id]) # ここを記述
    	@user = User.find_by(params[:id])
    	@books = @user.books.page(params[:page]).reverse_order
		book = Book.new(params[:content])
    		#user_id: @current_user.id
    		#@がないとローカル変数
      		if book.save
        		flash[:notice] = "Book was successfully created."
      		else
        		flash[:danger] = 'mistake'
      		end
    	redirect_to book
	end

 	def index
 		@user = User.find_by(params[:id]) # ここを記述
    	@books = @user.books.page(params[:page]).reverse_order
 	end

	def create
  		@user = User.new(user_params) #user_paramsはPOSTデータをチェックするメソッド
 		if @user.save
    		flash[:success] = '新しいユーザーを登録しました。'
    		redirect_to @user
  		else
    		flash.now[:danger] = 'ユーザーの登録に失敗しました。'
    		render :new
  		end
  	end

 	 def edit
        @user = User.find(params[:id])
    end

    def update
    	@user = User.find(params[:id])
    	@user.update(user_params)
    	redirect_to user_path(@user.id)
	end
private
	def user_params
    	params.require(:user).permit(:name, :profile_image, :profile_introduction)
	end
end
