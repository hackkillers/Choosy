class UsersController < ApplicationController
	def show
		@user = User.find(params[:id])
	end

	def create
		@user = User.new(user_params)
		if @user.save
			log_in(@user)
			flash[:success] = "Welcome to Choosy!"
			redirect_to user_url(@user)
		else
			render 'static_pages/signup'
		end
	end

	private
    def user_params
      params.require(:user).permit(:name, :email, :password,
                                   :password_confirmation)
    end
end
