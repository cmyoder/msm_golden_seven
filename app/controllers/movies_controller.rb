class MoviesController < ApplicationController

  def index
    @list_of_movies = Movie.all
  end

  def show
    @movie_id = params[:id].to_i
    movie = Movie.find(@movie_id)
    @movie_title = movie.title
    @movie_description = movie.description
    @movie_year = movie.year
    @movie_duration = movie.duration
    @movie_image_url = movie.image_url
  end

  def destroy
    @id_to_destroy = params[:id]
    m = Movie.find(@id_to_destroy)
    m.destroy

    redirect_to("/movies")
  end

  def new_form

  end

  def create_row
    m = Movie.new
    m.title = params[:title]
    m.description = params[:description]
    m.year = params[:year]
    m.duration = params[:duration]
    m.image_url = params[:image_url]
    m.save

    redirect_to("/movies")
  end

  def edit_form
    @id_to_edit = params[:id]
    m = Movie.find(@id_to_edit)
    @old_title = m.title
    @old_image_url = m.image_url
    @old_year = m.year
    @old_duration = m.duration
    @old_description = m.description
  end

  def update_row
    @edit_id = params[:id]
    m = Movie.find(@edit_id)
    m.title = params[:title]
    m.year = params[:year]
    m.duration = params[:duration]
    m.description = params[:description]
    m.image_url = params[:image_url]
    m.save

    redirect_to("/movies/#{@edit_id}")
  end
end
