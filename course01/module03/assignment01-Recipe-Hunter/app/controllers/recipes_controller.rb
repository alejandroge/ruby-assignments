class RecipesController < ApplicationController
  def index
    default_search = 'chocolate'

    @search = params[:search] || default_search
    @recipes = Recipe.for(@search)
  end
end
