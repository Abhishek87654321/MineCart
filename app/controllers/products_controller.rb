class ProductsController < ApplicationController
  def new
    @product = Product.new 
    authorize @product
  end

  def create
    @product = Product.new(product_params)
    authorize @product
    if @product.save
      flash[:notice] = "Product has been successfully created."
      redirect_to products_path, status: 301
    else
    end
  end

  def edit
    @product = Product.find(params[:id])
    authorize @product
  end

  def update
    @product = Product.find(params[:id])
    authorize @product
  end

  def show
    @product = Product.find(params[:id])
  end

  def index
    @products= Product.all
  end

  def destroy
    @product = Product.find(params[:id])
    authorize @product
    @product.delete
  end

  def add_item
    @product = Product.find(params[:id])
    authorize @product
  end

  def add_to_cart
    product = Product.find(params[:id])
    current_cart.line_items.create(product: product, quantity: 1)
    redirect_to cart_path(current_cart)
  end

  def checkout
  end

  private

  def product_params
    params.require(:product).permit(:name, :price, :quantity)
  end
end
