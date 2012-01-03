class ImageController < ApplicationController
  def show
    @image = Image.find_by_slug(params[:id])
    if @image.categories.any?
      @related_products = @image.categories.first.images.select { |p| p != @image }[0..2]
    else
      @related_products = []
    end
  end
end
