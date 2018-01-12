class ProductsController < ApplicationController
	def index
		@products = Product.all # not load categories once
		#products = Product.includes(:category).all

	end

   def show 
   	@product = Product.find(params[:id])
   end


end
