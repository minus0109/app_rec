class RadioactorsController < ApplicationController
  def index
    @radioactors = Radioactor.all
  end

  def show
    @radioactor = Radioactor.find(params[:id])
  end
end
