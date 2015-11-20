class BandsController < ApplicationController
  before_action :require_current_user!

  def new
    @band = Band.new
  end

  def create
    @band = Band.new(band_params)

    if @band.save!
      flash[:notice] = ["Successfully added band #{@band.name}!"]
      redirect_to band_url(@band)
    else
      flash.now[:errors] = @band.errors.full_messages
      render :new
    end
  end

  def edit
    @band = Band.find(params[:id])
  end

  def update
    @band = Band.update(params[:id], band_params)
    if @band.save!
      flash[:notice] = ["Successfully updated band #{@band.name}!"]
      redirect_to band_url(@band)
    else
      flash.now[:errors] = @band.errors.full_messages
      render :edit
    end
  end

  def index
  end

  def show
    @band = Band.find(params[:id])

  end

  def destroy
    @band = Band.find(params[:id])
    if @band.destroy!
      flash[:notice] = ["Successfully deleted the band."]
      redirect_to bands_url
    else
      flash.now[:errors] = @band.errors.full_messages
      render :show
    end
  end

  private

  def band_params
    params.require(:band).permit(:name)
  end

end
