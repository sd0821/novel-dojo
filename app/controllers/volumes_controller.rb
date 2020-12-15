class VolumesController < ApplicationController
  before_action :edit_volume, only: [:edit, :update]
  before_action :destroy_volume, only: [:destroy]
  before_action :set_title

  def index
    @volumes = @title.volumes.includes(:user)
  end

  def new
    @volume = Volume.new
  end

  def create
    @volume = @title.volumes.new(volume_params)
    if @volume.save
      redirect_to title_volumes_path(@title)
    else
      render :new
    end
  end

  def edit
  end

  def update
    @volume = Volume.find(params[:id])
    if @volume.update(volume_params)
      redirect_to title_volumes_path(@title)
    else
      render :edit
    end
  end

  def show
    @volume = Volume.find(params[:id])
  end

  def destroy
    if @volume.destroy
      redirect_to title_volumes_path(@title) 
    end
  end

  private
  def volume_params
    params.require(:volume).permit(:name, :content).merge(user_id: current_user.id)
  end

  def set_title
    @title = Title.find(params[:title_id])
  end

  def edit_volume
    @volume = Volume.find(params[:id])
  end

  def destroy_volume
    @volume = Volume.find(params[:id])
  end

end
