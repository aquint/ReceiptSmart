class UsersController < ApplicationController
	def new
		@user = User.new
	end
	def create
		@user = User.new(user_params)
		if @user.save
			@user.send_activation_email
			flash[:success] = "Please check your email to activate your account."
      		redirect_to root_url
		else
			render 'new'
		end
	end
	def show
		@receipt = current_user.receipts.build if logged_in?
		@monthlytotal = current_user.receipts.monthlyTotal();
		@user = User.find(params[:id])
		@receipts = @user.receipts.filter(params[:select_tag_query], params[:select_tag_param]).search(params[:search]).paginate(:per_page => 5, :page => params[:page])
		respond_to do |format|
			format.html {}
		    format.js 
		end
	end
	private
		def user_params
			params.require(:user).permit(:email, :name, :password, :password_confirmation)
		end
end
