class QuestionsController < ApplicationController
  before_action :authenticate_user!, only: [:create, :update, :destroy]

  def index
    @questions = Question.page(params[:page]).order(created_at: :desc)
  end

  def show
    if params[:question_id]
      @question = Question.find(params[:question_id])
      @answer   = Answer.find(params[:id])
    else
      @question = Question.find(params[:id])
      @answer   = Answer.new
    end
  end

  def new
    @question = Question.new
  end


  def create
    @question = Question.new(question_params)
    if @question.save
      flash[:notice] = "New question added successfully"
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
      flash[:notice] = "Question edited successfully"
      redirect_to questions_path
    else
      render :edit
    end
  end

  def destroy
    Answer.where(question_id: params[:id]).destroy_all
    Question.delete(params[:id])
    flash[:notice] = "Question deleted!"
    redirect_to questions_path
  end

protected
  def question_params
    params.require(:question).permit(:title, :description, :user_id)
  end
end
