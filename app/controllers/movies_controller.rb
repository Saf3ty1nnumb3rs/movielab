class MoviesController < ApplicationController
  
  
  
  def index
    @movies = Movie.all
  end
  
  def show
    @movie = Movie.find(params[:id])
  end

  def new
    @movie = Movie.new
  end


  def create
    @new_movie = Movie.create(movie_params)
    redirect_to movie_path(@new_movie.id)
  end

  def edit
    @movie = Movie.find(params[:id])
  end

  def update
    @movie = Movie.find(params[:id])
    @movie.update(movie_params)
    redirect_to movie_path(@movie.id)
  end

  def destroy
    Movie.find(params[:id]).destroy
    redirect_to movies_path    
  end


  private

  def movie_params
    params.require(:movie).permit(:title, :picture, :year, :genre, :synopsis)
  end


end
