class ImageController < ApplicationController
  def show
    @image = Image.find_by_slug(params[:id])
  end
end
