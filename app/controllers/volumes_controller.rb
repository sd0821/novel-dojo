class VolumesController < ApplicationController
  # before_action :set_volume, only: [:show]
  before_action :set_title

  def index
    @volumes = @title.volumes.includes(:user)
    # binding.pry
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

  def show
    # @volumes = Volume.find(params[:title_id])
    # @volumes = @title.volumes.includes(:user)
    # @volumes = Volume.all
    @volume = Volume.find(params[:id])
    # @volume
  end

  private
  def volume_params
    params.require(:volume).permit(:name, :content).merge(user_id: current_user.id)
  end

  def set_title
    @title = Title.find(params[:title_id])
  end

  # def set_volume
  #   @volume = Volume.find(params[:id])
  # end

end
