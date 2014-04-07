class HomeController < ApplicationController
  def index
    @images = Image.where(is_featured: true)
    @nodes = ::PiggybakTaxonomy::NavigationNode.all.select { |n| n.is_root? }
  end
end
