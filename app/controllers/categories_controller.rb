class CategoriesController < ApplicationController
  before_action :sign_in_user, only: [:index]
  before_action :teacher_user, only: [:new, :edit, :update, :destroy]

  def index
    @categories = Category.all
  end

  def show
    @category = Category.find params[:id]
    @words = @category.words
    @word = Word.new
  end

  def new
    @category = Category.new
  end

  def create
    @category = Category.new category_params
    if @category.save
      flash[:success] = "Created successful"
      redirect_to categories_url
    else
      render 'new'
    end
  end

  def edit
    @category = Category.find params[:id]
  end

  def update
    @category = Category.find params[:id]
    if @category.update_attributes category_params
      flash[:success] = "Updated"
      redirect_to @category
    else
      render 'edit'
    end
  end

  def destroy
    @category = Category.find params[:id]
    @category.destroy
    flash[:success] = "Category deleted"
    redirect_to categories_url
  end

  private

    def category_params
      params.require(:category).permit(:name, :des)
    end

    def teacher_user
      redirect_to(root_url) unless current_user.role == 2
    end
end
