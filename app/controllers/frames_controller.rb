class FramesController < ApplicationController
  def show
    @frame = Frame.find(1)

    if @frame.nil?
      redirect_to root_url
    end
  end
end
