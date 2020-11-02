class TitlesController < ApplicationController


  def new
    @title = Title.new
  end

  def create
    @title = Title.new(title_params)
    if @title.save
      redirect_to root_path
    else
      render :new
    end
  end


  private
  def title_params
    params.require(:title).permit(:name).merge(user_id: current_user.id)
  end


end