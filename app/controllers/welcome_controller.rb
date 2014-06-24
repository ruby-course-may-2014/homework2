class WelcomeController < ApplicationController
  def show
    @sample_movie = wrap_movie(Movie.order("RANDOM()").first)
  end
end
