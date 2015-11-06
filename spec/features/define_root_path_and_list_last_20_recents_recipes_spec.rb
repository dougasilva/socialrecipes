require 'rails_helper'
feature 'Define root path and list recipes' do
  scenario 'Root path is recipes list successffully' do
    visit root_path
    expect(page).to have_content('RECEITAS')
  end

  scenario ' List last 20 recipes' do
    create_list(:recipe, 25)

    visit root_path
  end
end
