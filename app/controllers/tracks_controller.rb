class TracksController < ApplicationController
  before_action :require_current_user!

  def new
    @track = Track.new
  end

  def create
    @track = Track.new(track_params)

    if @track.save
      flash[:notice] << "Successfully added track #{@track.title}!"
      redirect_to track_url(@track)
    else
      flash.now[:errors] = @track.errors.full_messages
      render :new
    end
  end

  def edit
  end

  def updated
  end

  def show
  end

  def destroy
  end

  def track_params
    params.require(:user).permit(:title, :album_id, :ttype, :lyrics)
  end

end
