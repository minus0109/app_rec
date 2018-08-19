class CategoriesController < ApplicationController
  def index
    @categories = Category.all
  end

  def show
    @games = Game.includes(:categories).where(categories: {id: params[:id]})
  end
end
