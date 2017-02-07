class ActorsController < ApplicationController

  def index
    @list_of_actors = Actor.all
  end

  def show
    @actor_id = params[:id].to_i
    actor = Actor.find(@actor_id)
    @actor_name = actor.name
    @actor_bio = actor.bio
    @actor_dob = actor.dob
    @actor_image_url = actor.image_url
  end

  def destroy
    @id_to_destroy = params[:id]
    a = Actor.find(@id_to_destroy)
    a.destroy

    redirect_to("/actors")
  end

  def new_form

  end

  def create_row
    a = Actor.new
    a.name = params[:name]
    a.bio = params[:bio]
    a.dob = params[:dob]
    a.image_url = params[:image_url]
    a.save

    redirect_to("/actors")
  end

  def edit_form
    @id_to_edit = params[:id]
    a = Actor.find(@id_to_edit)
    @old_name = a.name
    @old_image_url = a.image_url
    @old_dob = a.dob
    @old_bio = a.bio
  end

  def update_row
    @edit_id = params[:id]
    a = Actor.find(@edit_id)
    a.name = params[:name]
    a.dob = params[:dob]
    a.bio = params[:bio]
    a.image_url = params[:image_url]
    a.save

    redirect_to("/actors/#{@edit_id}")
  end
end
