class NovelsController < ApplicationController
  
  def index
    @titles = Title.all
  end


end
