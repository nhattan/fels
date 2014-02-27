class WordsController < ApplicationController
  before_action :sign_in_user, only: [:index]
  before_action :teacher_user, only: [:show, :new, :edit, :update, :destroy]

  def index
    if params[:category_id]
      @category = Category.find params[:category_id]
      @words = @category.words
    else
      @words = Word.all
    end
  end

  def show
    @word = Word.find params[:id]
  end

  def new
    @word = Word.new
    @categories = Category.order(:name)
  end

  def create
    @word = Word.new word_params
    if @word.save
      flash[:success] = "Created successfull"
      redirect_to Category.find word_params[:category_id]
    else
      flash[:error] = "Please fill all the field"
      redirect_to Category.find word_params[:category_id]
    end
  end

  def edit
    @word = Word.find params[:id]
  end

  def update
    @word = Word.find params[:id]
    if @word.update_attributes word_params
      flash.now[:success] = "Updated"
      redirect_to @word
    else
      render 'edit'
    end
  end

  def destroy
    @word = Word.find params[:id]
    @category = @word.category
    @word.destroy
    flash[:success] = "Word deleted"
    redirect_to @category
  end

  private

    def word_params
      params.require(:word).permit(:id, :content, :meaning, :category_id,
        answers_attributes: [:id, :content, :correct])
    end

    def teacher_user
      redirect_to(root_url) unless current_user.role == 2
    end
end
