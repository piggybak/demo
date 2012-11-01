class FramesController < ApplicationController
  def show
    @frame = Frame.find_by_slug(params[:id])

    if @frame.nil?
      frame = Frame.find_by_id(params[:id])
      if frame
        redirect_to frame_url(frame.slug), :status => 301
      else
        redirect_to root_url
      end
    end
  end
end
