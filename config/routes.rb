#config/routes.rb
Rails.application.routes.draw do

  get("/", { :controller => "omnicalc", :action => "square_form" })

  get("/square/new", { :controller => "omnicalc", :action => "square_form" })

  get("/square/results", { :controller => "omnicalc", :action => "square_result" })



end
