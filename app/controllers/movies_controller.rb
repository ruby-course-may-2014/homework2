class MoviesController < ApplicationController
  before_action :authenticate_user!
  helper_method :ratings_params, :all_ratings

  def index
    session[:sort_by] = params[:sort_by] if params[:sort_by]
    session[:ratings] = params[:ratings] if params[:ratings]
    @movies = policy_scope(
      Movie.list(rating: ratings_params.keys, order: session[:sort_by])
    ).map { |m| wrap_movie(m) }
  end

  def show
    @movie = find_movie
  end

  def new
    @movie = Movie.new
    authorize @movie
  end

  def create
    @movie = Movie.new movie_params
    @movie.user = current_user
    authorize @movie

    if @movie.save
      flash[:notice] = "#{@movie.title} was successfully created."
      redirect_to movies_url
    else
      render 'new'
    end
  end

  def edit
    @movie = find_movie
    authorize @movie
  end

  def update
    @movie = find_movie
    authorize @movie
    if @movie.update_attributes_with_draft movie_params
      flash[:notice] = "#{@movie.title} was successfully updated."
      redirect_to movies_url
    else
      render 'edit'
    end
  end

  def publish
    @movie = find_movie
    @movie.publish!
    redirect_to movies_url
  end

  def destroy
    @movie = find_movie
    @movie.destroy
    flash[:notice] = "Movie '#{@movie.title}' deleted."
    redirect_to movies_url
  end

  private

  def find_movie
    wrap_movie(Movie.find(params[:id]))
  end

  def movie_params
    fields = [:title, :rating, :release_date, :description]
    fields += [:published] if current_user.admin?

    ns = params.key?(:movie_draft) ? :movie_draft : :movie_published

    params.require(ns).permit(fields)
  end

  def all_ratings
    @all_ratings ||= Movie.all_ratings
  end

  def ratings_params
    session[:ratings] || Hash[all_ratings.map {|x| [x, "1"]}]
  end

end
