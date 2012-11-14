class ImagesController < ApplicationController
  def show
    @image = Image.find_by_slug(params[:id])

    if @image.nil?
      image = Image.find_by_id(params[:id])
      if image
        redirect_to image_url(image.slug), :status => 301
      else
        redirect_to root_url
      end
    else
      if @image.piggybak_sellable.navigation_nodes.any?
        @related_images = @image.piggybak_sellable.navigation_nodes.first.sellables.collect { |s| s.item }.select { |p| p != @image }[0..2]
      else
        @related_images = []
      end
    end
  end
end
