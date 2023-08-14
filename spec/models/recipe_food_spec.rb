require 'rails_helper'

RSpec.describe RecipeFood, type: :model do
  before(:each) do
    @recipe = Recipe.create(name: 'Test Recipe', preparation_time: '1 hr', cooking_time: '1 hr', description: 'Test',
                            public: true)
    @food = Food.create(name: 'Test Food', measurement_units: 'grams', price: 10, quantity: 1)
  end

  it 'is valid with valid attributes' do
    recipe_food = RecipeFood.new(recipe: @recipe, food: @food, quantity: 2)
    expect(recipe_food).to be_valid
  end

  it 'is not valid without a quantity' do
    recipe_food = RecipeFood.new(recipe: @recipe, food: @food, quantity: nil)
    expect(recipe_food).not_to be_valid
  end

  it 'is not valid with a negative quantity' do
    recipe_food = RecipeFood.new(recipe: @recipe, food: @food, quantity: -2)
    expect(recipe_food).not_to be_valid
  end
end
