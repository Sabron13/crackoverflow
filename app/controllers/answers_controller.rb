class AnswersController < ApplicationController
  def new
    @question = Post.find(params[:id])
    @answer = @question.answers.build
  end

  def create
    question = Post.find(params[:question_id])
    answer = question.answers.build(answer_params)
    if answer.save
      redirect_to question_path(question)
    else
      flash[:notice] = "Please submit answer again."
      redirect_to question_path(question)
    end
  end

  def show
  end

  private

  def answer_params
    params.require(:answer).permit(:content)
  end

end