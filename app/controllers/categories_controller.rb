class CategoriesController < ApplicationController
  def new
  end
   
  def show
  end

  def update
  @category=Category.find(params[:category_id])
  redirect_to '/pictures/allpict'
  end

end
