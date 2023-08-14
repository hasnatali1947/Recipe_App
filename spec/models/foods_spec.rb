require 'rails_helper'

RSpec.describe Food, type: :model do
  before(:each) do
    @user = User.create(name: 'Test user', email: 'test444@gmail.com', password: '123456',
                        password_confirmation: '123456')
  end

  it 'is valid with valid attributes' do
    food = Food.new(name: 'Test food', measurement_units: 'pce', price: 12.2, quantity: 4, user: @user)
    expect(food).to be_valid
  end

  it 'is not valid without a name' do
    food = Food.new(measurement_units: 'pce', price: 12.2, quantity: 4, user: @user)
    expect(food).not_to be_valid
  end

  it 'is not valid without measurement_units' do
    food = Food.new(name: 'Test food', price: 12.2, quantity: 4, user: @user)
    expect(food).not_to be_valid
  end

  it 'is not valid without a price' do
    food = Food.new(name: 'Test food', measurement_units: 'pce', quantity: 4, user: @user)
    expect(food).not_to be_valid
  end

  it 'is not valid without a quantity' do
    food = Food.new(name: 'Test food', measurement_units: 'pce', price: 12.2, user: @user)
    expect(food).not_to be_valid
  end

  it 'is not valid with a negative price' do
    food = Food.new(name: 'Test food', measurement_units: 'pce', price: -12.2, quantity: 4, user: @user)
    expect(food).not_to be_valid
  end

  it 'is not valid with a negative quantity' do
    food = Food.new(name: 'Test food', measurement_units: 'pce', price: 12.2, quantity: -4, user: @user)
    expect(food).not_to be_valid
  end
end
