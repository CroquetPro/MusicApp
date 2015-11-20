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
  end

  def updated
  end

  def show
    @album = Album.find(params[:id])
  end

  def destroy
  end

  private

  def album_params
    params.require(:album).permit(:name, :band_id, :atype)
  end

end
