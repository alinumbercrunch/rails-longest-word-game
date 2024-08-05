require 'open-uri'

class InputsController < ApplicationController
  def play
    @random_letters = ('A'..'Z').to_a.sample(9)
    start_time = Time.now
    end_time = Time.now
  end

  def score
    @user_answer = params[:user_word]
    result = URI.open("https://dictionary.lewagon.com/#{@user_answer}").read
    word = JSON.parse(result)
    @random_letters = params[:random_letters].split


    @all_included = @user_answer.chars.all? do |letter|
      @random_letters.include?(letter)
    end
  if word["found"]
    if @all_included
      @score = "Congrats"
    else
      @score = "Your score is zero"
    end
  end
  end
end
