class AnswersController < ApplicationController
  def answer
    @user_answer = params[:user_word]
    @random_letters = ('A'..'Z').to_a.sample(10)
  end
end
