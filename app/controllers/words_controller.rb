class WordsController < ApplicationController
  before_action :sign_in_user, only: [:index]
  before_action :teacher_user, only: [:new, :edit, :update, :destroy]

  def index
    @words = Word.all
  end

  def create
    @word = Word.new word_params
    if @word.save
      flash[:success] = "Created successfull"
      redirect_to Category.find word_params[:category_id]
    else
      flash[:error] = "Please try again"
      redirect_to Category.find word_params[:category_id]
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
      params.require(:word).permit(:content, :meaning, :category_id)
    end

    def teacher_user
      redirect_to(root_url) unless current_user.role == 2
    end
end
