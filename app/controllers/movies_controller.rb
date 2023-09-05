class MoviesController < ApplicationController
  before_action :set_movie, only: %i[edit update]
  def index
    @movies = Movie.all
  end

  def edit
  end

  def update
    if @movie.update(movie_params)
      redirect_to list_path(params[:movie][:list_id])
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def set_movie
    @movie = Movie.find(params[:id])
  end

  def movie_params
    params.require(:movie).permit(:title, :photo)
  end
end
