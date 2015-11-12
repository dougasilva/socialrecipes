require 'rails_helper'
feature 'Define root path and list recipes' do
  scenario 'Root path is recipes list successffully' do
    visit root_path
    expect(page).to have_content 'Cozinhas'
  end
end
