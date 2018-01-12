class ProductsController < ApplicationController
	def index
		#@products = Product.all # not load categories once
		@products = Product.includes(:category).all

	end

	def new
		@product = Product.new
	end

	def create
		@product = Product.new(product_params)
		# byebug # debug system
		flash[:notice] = 'You have successfully created the product'
		
		# return redirect_to products_path if @product.save
		return redirect_to products_path, notice: 'successfully' if @product.save
		flash.now[:notice] = 'Not save'
		render :new
	end


   def show 
   	@product = Product.find(params[:id])
   end

   private
   def product_params
   	params.require(:product).permit(:title, :description, :price, :category)
   end


end
