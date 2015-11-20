class AlbumsController < ApplicationController
  before_action :require_current_user!

  def new
    @album = Album.new(band_id: params[:band_id])
  end

  def create
    @album = Album.new(album_params)

    if @album.save
      flash[:notice] = ["Successfully added album #{@album.name}!"]
      redirect_to album_url(@album)
    else
      flash.now[:errors] = @album.errors.full_messages
      render :new
    end
  end

  def edit
    @album = Album.find(params[:id])
  end

  def update
    @album = Album.update(params[:id], album_params)
    if @album.save!
      flash[:notice] = ["Successfully updated album #{@album.name}!"]
      redirect_to album_url(@album)
    else
      flash.now[:errors] = @album.errors.full_messages
      render :edit
    end
  end

  def show
    @album = Album.find(params[:id])
  end

  def destroy
      @album = Album.find(params[:id])
      if @album.destroy!
        flash[:notice] = ["Successfully deleted the album."]
        redirect_to bands_url
      else
        flash.now[:errors] = @album.errors.full_messages
        render :show
      end
  end

  private

  def album_params
    params.require(:album).permit(:name, :band_id, :atype)
  end

end
