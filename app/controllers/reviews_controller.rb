class ReviewsController < ApplicationController
  before_action :admin_access, only: [:destroy,:edit,:update]
  before_action :authorize, only: [:create,:new]

  def new
    @product = Product.find(params[:product_id])
    @review = @product.reviews.new
    render :new
  end

  def create
    @product = Product.find(params[:product_id])
    @review = @product.reviews.new(review_params)
    if @review.save
      flash[:notice] = "Review successfully added, Thank you!"
      redirect_to product_path(@product)
    else
      flash[:alert] = "Review Not successfully added!"
      render :new
    end
  end

  def show
    @product = Product.find(params[:product_id])
    @review = Review.find(params[:id])
    render :show
  end

  def edit
    @product = Product.find(params[:product_id])
    @review = Review.find(params[:id])

    render :edit
  end

  def update
    @review = Review.find(params[:id])
    if @review.update(review_params)
      flash[:notice] = "Review successfully updated!"
      redirect_to product_path(@review.product)
    else
      render :edit
    end
  end

  def destroy
    @review = Review.find(params[:id])
    @review.destroy
    flash[:notice] = "Review successfully deleted!"
    redirect_to product_path(@review.product)
  end

  private
  def review_params
    params.require(:review).permit(:author, :content_body, :rating)
  end
end
