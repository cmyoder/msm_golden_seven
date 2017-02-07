class DirectorsController < ApplicationController

  def index
    @list_of_directors = Director.all
  end

  def show
    @director_id = params[:id].to_i
    director = Director.find(@director_id)
    @director_name = director.name
    @director_bio = director.bio
    @director_dob = director.dob
    @director_image_url = director.image_url
  end

  def destroy
    @id_to_destroy = params[:id]
    d = Director.find(@id_to_destroy)
    d.destroy

    redirect_to("/directors")
  end

  def new_form

  end

  def create_row
    d = Director.new
    d.name = params[:name]
    d.bio = params[:bio]
    d.dob = params[:dob]
    d.image_url = params[:image_url]
    d.save

    redirect_to("/directors")
  end

  def edit_form
    @id_to_edit = params[:id]
    d = Director.find(@id_to_edit)
    @old_name = d.name
    @old_image_url = d.image_url
    @old_dob = d.dob
    @old_bio = d.bio
  end

  def update_row
    @edit_id = params[:id]
    d = Director.find(@edit_id)
    d.name = params[:name]
    d.dob = params[:dob]
    d.bio = params[:bio]
    d.image_url = params[:image_url]
    d.save

    redirect_to("/directors/#{@edit_id}")
  end
end
