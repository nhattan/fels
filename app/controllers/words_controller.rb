class WordsController < ApplicationController
  before_action :sign_in_user, only: [:index]
  before_action :teacher_user, only: [:new, :edit, :update, :destroy]

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
  end

  def create
    @word = Word.new word_params
    if @word.save
      flash[:success] = "Created successfull"
      redirect_to Category.find word_params[:category_id]
    else
      render 'new'
    end
  end

  def edit
    @word = Word.find params[:id]
  end

  def update
    @word = Word.find params[:id]
    if @word.update_attributes word_params
      flash.now[:success] = "Updated"
      redirect_to words_url
    else
      render 'edit'
    end
  end

  def destroy
    @word = Word.find params[:id]
    @word.destroy
    flash[:success] = "Word deleted"
    redirect_to words_url
  end

  private

    def sign_in_user
      unless signed_in?
        store_location
        redirect_to signin_url, notice: "Please sign in"
      end
    end

    def word_params
      params.require(:word).permit(:content, :meaning, :category_id,
        answers_attributes: [:content, :correct])
    end

    def teacher_user
      redirect_to(root_url) unless current_user.role == 2
    end
end
