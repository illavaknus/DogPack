class SearchController < ApplicationController
  
  
  def search
    gon.dogs = User.all
    
    respond_to do |format|
      format.html #search.html.erb
    end
  end
  
end
