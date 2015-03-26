class AnswersController < ApplicationController
  before_action :authenticate_user!

  def create
    @question = Question.find(params[:question_id])
    @answer = Answer.new(answer_params)
    @answer.question = @question
    @answer.user = current_user
    if @answer.save
      flash[:notice] = "Answer added successfully"
      redirect_to question_path(@question)
    else
      render 'questions/show'
    end
  end

  def update
    @answer = Answer.find(params[:id])
    if @answer.update(answer_params)
      flash[:notice] = "Answer edited successfully"
      redirect_to question_path(params[:answer][:question_id].to_i)
    else
      @question = Question.find(params[:answer][:question_id].to_i)
      render template: 'questions/show'
    end
  end

  def destroy
    @answer = Answer.find(params[:id])
    @question = @answer.question
    Answer.delete(@answer)
    flash[:notice] = "Answer deleted!"
    redirect_to question_path(@question)
  end

protected
  def answer_params
    params.require(:answer).permit(:body)
  end
end
