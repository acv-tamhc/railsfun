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
		flash[:notice] = 'You have successfully created the product' # Trễ một bước sau mới hiện
		# flash.now[:notice] = 'There' # hiện ngay lập tức ở vị trí thay đổi (:placeholder) - chi thay đổi một vùng
		return redirect_to products_path if @product.save
		render :new # 
	end


   def show 
   	@product = Product.find(params[:id])
   end

   private
   def product_params
   	params.require(:product).permit(:title, :description, :price, :category)
   end


end
