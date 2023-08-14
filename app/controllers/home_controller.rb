class HomeController < ApplicationController
  def index
    @foods = Food.all
    @recipes = Recipe.includes(:user, :foods).where(public: true)
  end
end
