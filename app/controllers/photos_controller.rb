class PhotosController < ApplicationController
  def create
    @room = Room.find(params[:room_id])

    if params[:images]
      params[:images].each do |img|
        @room.photos.force_encoding('UTF-8').create(image: img)
      end
      redirect_back(fallback_location: request.referer, notice: "Saved...")
    end
  end
end