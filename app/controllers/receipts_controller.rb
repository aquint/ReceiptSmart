class ReceiptsController < ApplicationController
	before_action :logged_in_user, only: [:create, :destroy]

	def create
		@receipt = current_user.receipts.build(receipt_params)
		if @receipt.save
			flash[:sucess] = "Receipt created!"
			redirect_to user_path(current_user)
		else
			flash[:danger] = "One or more required fields are empty."
			redirect_to user_path(current_user)
		end
	end
	def destroy
  	end
  	private
  		def receipt_params
  			params.require(:receipt).permit(:store, :credit_card, :subtotal, :total, :card_num, :image)
  		end
end
