class WelcomeController < ApplicationController
  def show
    @sample_movie = Movie.order("RANDOM()").first
  end
end
