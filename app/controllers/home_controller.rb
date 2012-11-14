class HomeController < ApplicationController
  def index
    @images = Image.find_all_by_is_featured(true)
    @nodes = ::PiggybakTaxonomy::NavigationNode.all.select { |n| n.is_root? }
  end
end
