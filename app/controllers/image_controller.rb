class ImageController < ApplicationController
  def show
    @image = Image.find_by_slug(params[:id])
    @related_products = @image.categories.first.images.select { |p| p != @image }[0..2]
  end
end
