class UsersController < ApplicationController
	def show
		@image_pairs = current_user.image_pairs.order(created_at: :desc)
	end

	def create
	end

	def edit
	end

	def update
  end
end
