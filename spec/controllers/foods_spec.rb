require 'rails_helper'

RSpec.describe FoodsController, type: :controller do
  describe 'GET #index' do
    context 'when user is authenticated' do
      before do
        @user = User.create(name: 'Test user', email: 'test444@gmail.com',
                            password: '123456', password_confirmation: '123456')
        sign_in @user
        get :index
      end

      it 'assigns @foods with user foods' do
        expect(assigns(:foods)).to eq(@user.foods)
      end

      it 'renders the index template' do
        expect(response).to render_template(:index)
      end

      it 'returns a successful response' do
        expect(response).to be_successful
      end
    end

    context 'when user is not authenticated' do
      before { get :index }

      it 'redirects to the sign-in page' do
        expect(response).to redirect_to(new_user_session_path)
      end
    end
  end

  describe 'POST #create' do
    context 'when user is authenticated' do
      before do
        @user = User.create(name: 'Test user', email: 'test444@gmail.com',
                            password: '123456', password_confirmation: '123456')
        sign_in @user
      end

      context 'with valid parameters' do
        let(:valid_params) do
          { food: { name: 'Test food', measurement_unit: 'pce', price: 12.2, quantity: 4 } }
        end
      end
    end

    context 'when user is not authenticated' do
      it 'redirects to the sign-in page' do
        post :create
        expect(response).to redirect_to(new_user_session_path)
      end
    end
  end

  describe 'DELETE #destroy' do
    context 'when user is authenticated' do
      before do
        @user = User.create(name: 'Test user', email: 'test444@gmail.com',
                            password: '123456', password_confirmation: '123456')
        sign_in @user
        @food = Food.create(name: 'Test food', measurement_unit: 'pce', price: 12.2, quantity: 4, user: @user)
      end
    end
  end
end
