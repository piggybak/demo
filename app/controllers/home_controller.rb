class HomeController < ApplicationController
  def index
    @images = Image.all
  end
end
