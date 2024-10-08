class Admin::CategoriesController < ApplicationController

  def index
    @categories = Category.all
  end

  def new
    @category = Category.new
  end

  def create
    @categories = Category.new(category_params)

    if @categories.save
      redirect_to [:admin, :categories], notice: 'New Category created!'
    else
      render :new
    end
  end

  private  def category_params
    params.require(:category).permit(:name)
  end


end
