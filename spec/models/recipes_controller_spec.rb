require 'rails_helper'

RSpec.describe RecipesController, :type => :controller do
  describe '#index' do
    before do
      @recipes = create_list(:recipe, 25)
    end
    it 'displays a 20 recipes only' do
      get :index
      expect(response).to be_success
      expect(assigns(:recipes).count).to eq 20
      expect(response).to render_template(:index)
    end
  end

  describe '#new' do
    context 'when user is signed in' do
      it 'sets up a new recipe instance' do
        get :new
        expect(response).to be_success
        expect(assigns(:recipe)).to be_new_record
        expect(response).to render_template('new')
      end
    end
  end

  describe '#create' do
    context 'when new recipe is saved' do
      it 'creates a new recipe and saves it to the db' do
        expect {
          create(:recipe)
        }.to change(Recipe, :count).by(1)
      end
    end
    context 'when new recipe fails to save' do
      it 'renders the new template and does Not save to the db' do
        post :create, recipe: { name: 'soup', preference: nil }
        expect(response).to render_template('new')
        expect(Recipe.count).to eq 0
      end
    end
  end

  describe '#show' do
    before do
      @recipe = create(:recipe, name: 'Soup')
    end
    it 'displays the selected recipe' do
      get :show, id: @recipe.id
      expect(response).to be_success
      expect(assigns(:recipe).name).to eq 'Soup'
      expect(response).to render_template('show')
    end
  end
end
