class TitlesController < ApplicationController
  before_action :edit_title, only: [:edit, :update]
  before_action :destroy_title, only: [:destroy]


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

  def edit
  end

  def update
    @title = Title.find(params[:id])
    if @title.update(title_params)
      redirect_to title_volumes_path(@title.id)
    else
      render :edit
    end
  end

  def destroy
    if @title.destroy
      redirect_to root_path 
    end
  end

  private
  def title_params
    params.require(:title).permit(:name).merge(user_id: current_user.id)
  end

  def edit_title
    @title = Title.find(params[:id])
  end

  def destroy_title
    @title = Title.find(params[:id])
  end

end