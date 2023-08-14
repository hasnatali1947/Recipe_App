require 'rails_helper'

RSpec.describe Recipe, type: :model do
  before(:each) do
    @user = User.create(name: 'Test user', email: 'test444@gmail.com', password: '123456',
                        password_confirmation: '123456')
  end

  it 'is valid with valid attributes' do
    recipe = Recipe.new(name: 'Test Recipe', preparation_time: 60, cooking_time: 30,
                        description: 'Test description', user: @user)
    expect(recipe).to be_valid
  end

  it 'is not valid without a name' do
    recipe = Recipe.new(name: nil, preparation_time: 60, cooking_time: 30,
                        description: 'Test description', user: @user)
    expect(recipe).not_to be_valid
  end

  it 'is not valid without a preparation time' do
    recipe = Recipe.new(name: 'Test Recipe', preparation_time: nil, cooking_time: 30,
                        description: 'Test description', user: @user)
    expect(recipe).not_to be_valid
  end

  it 'is not valid with a negative preparation time' do
    recipe = Recipe.new(name: 'Test Recipe', preparation_time: -10, cooking_time: 30,
                        description: 'Test description', user: @user)
    expect(recipe).not_to be_valid
  end

  it 'is not valid without a cooking time' do
    recipe = Recipe.new(name: 'Test Recipe', preparation_time: 60, cooking_time: nil,
                        description: 'Test description', user: @user)
    expect(recipe).not_to be_valid
  end

  it 'is not valid with a negative cooking time' do
    recipe = Recipe.new(name: 'Test Recipe', preparation_time: 60, cooking_time: -10,
                        description: 'Test description', user: @user)
    expect(recipe).not_to be_valid
  end

  it 'is not valid without a description' do
    recipe = Recipe.new(name: 'Test Recipe', preparation_time: 60, cooking_time: 30,
                        description: nil, user: @user)
    expect(recipe).not_to be_valid
  end

  it 'is not valid without a user' do
    recipe = Recipe.new(name: 'Test Recipe', preparation_time: 60, cooking_time: 30,
                        description: 'Test description', user: nil)
    expect(recipe).not_to be_valid
  end
end
