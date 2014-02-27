class LessonsController < ApplicationController
  before_action :sign_in_user, only: [:new, :show, :edit, :update]

  def index
    @lessons = current_user.lessons
  end

  def show
    @lesson = Lesson.find params[:id]
    @category = @lesson.category
    @lesson_words = @lesson.lesson_words
  end

  def new
    @lesson = Lesson.new
    @category = Category.find params[:category_id]
    words = @category.words
    words.each do |word|
      @lesson.lesson_words.build word_id: word.id
    end
  end

  def create
    @lesson = Lesson.new lesson_params
    @category = @lesson.category
    @lesson.user_id = current_user.id
    if @lesson.save
      flash[:success] = "Lesson saved"
      redirect_to @lesson
    else
      flash[:error] = "Error"
      render 'new'
    end
  end

  def edit
    @lesson = Lesson.find params[:id]
    @category = @lesson.category
  end

  def update
    @lesson = Lesson.find params[:id]
    if @lesson.update_attributes lesson_params
      flash.now[:success] = "Updated"
      redirect_to @lesson
    else
      render 'edit'
    end 
  end

  def destroy
    @lesson = Lesson.find params[:id]
    @lesson.destroy
    flash[:success] = "Lesson deleted"
    redirect_to lessons_url
  end

  private

    def lesson_params
      params.require(:lesson).permit(:id, :category_id, 
        lesson_words_attributes: [:id, :word_id, :answer_id])
    end
end