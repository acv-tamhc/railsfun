class ProductsController < ApplicationController
 	before_action :get_product_by_id, only: [:show, :edit, :update, :destroy]

	def index
		#@products = Product.all # not load categories once
		@products = Product.includes(:category).all

	end

	def new
		if(params[:id])
			@product = Product.find(params[:id])
		else
			@product = Product.new
		end
	end

	def edit
		if(params[:id])
			@product = Product.find(params[:id])
		end
		render :new
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

	def update
		@product = Product.find(params[:id])

		return redirect_to products_path, notice: 'successfully'  if @product.update(product_params)
		flash.now[:notice] = 'Not save'
		render :new
	end

   def show 
   	@product = Product.find(params[:id])
   end

   def destroy

   	@product = Product.find(params[:id])
   	@product.published = false
   	flash[:notice] = 'Notice delete' 
   	flash[:notice] = 'Successfully' if @product.save 
   	#flash[:notice] = 'Successfully' if @product.destroy 

   	redirect_to products_path

   end

   private
   def product_params
   	# permit : field params
   	params.require(:product).permit(:title, :description, :price, :category_id) # notation => category = category_id
   end

   def get_product_by_id
   	@product = Product.find(product_id)
   end
   def product_id
   	params[:id]
   end

end
