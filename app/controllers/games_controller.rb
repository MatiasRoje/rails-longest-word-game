class GamesController < ApplicationController
  def new
    @letters = (0...10).map { (65 + rand(26)).chr }
  end

  def score
    @answer = params[:guess]
    @parsed_answer = parse_word(@answer)
  end

  def parse_word(input)
    url = "https://wagon-dictionary.herokuapp.com/#{input}"
    user_word = URI.open(url).read
    word_second = JSON.parse(user_word)
    return word_second["found"]
  end
end
