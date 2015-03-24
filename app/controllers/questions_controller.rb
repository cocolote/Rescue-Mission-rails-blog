class QuestionsController < ApplicationController
  def index
    @questions = Question.page(params[:page]).order(created_at: :desc)
  end

  def show
    @question = Question.find(params[:id])
  end

  def new
    @question = Question.new
  end

  def create
    @question = Question.new(question_params)
    if @question.save
      flash[:success] = "New question added successfully"
      redirect_to questions_path
    else
      render :new
    end
  end

  def edit
    @question = Question.find(params[:id])
  end

  def update
    @question = Question.find(params[:id])
    if @question.update(question_params)
      flash[:success] = "Question edited successfully"
      redirect_to questions_path
    else
      render :edit
    end
  end

  def destroy
    Question.delete(params[:id])
    flash[:success] = "Question deleted!"
    redirect_to questions_path
  end

protected
  def question_params
    params.require(:question).permit(:title, :description, :user_id)
  end
end
