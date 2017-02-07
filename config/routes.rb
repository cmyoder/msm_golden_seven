Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get("/",                       { :controller => "directors", :action => "index"})

  get("/directors",              { :controller => "directors", :action => "index"})
  get("/directors/new",          { :controller => "directors", :action => "new_form"})
  get("/directors/:id",          { :controller => "directors", :action => "show"})
  get("/directors/:id/edit",     { :controller => "directors", :action => "edit_form"})
  get("/delete_director/:id",    { :controller => "directors", :action => "destroy"})
  get("/create_director",        { :controller => "directors", :action => "create_row"})
  get("/update_director/:id",    { :controller => "directors", :action => "update_row"})

  get("/actors",                 { :controller => "actors", :action => "index"})

  get("/movies",                 { :controller => "movies", :action => "index"})

end
