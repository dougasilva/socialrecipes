require 'rails_helper'
feature 'Admin create new preference of food' do
  scenario 'Successffuly' do
    visit new_preference_path
    fill_in 'Nome:', with: 'Sem gluten'

    click_on 'Cadastrar'

    expect(page).to have_content 'Sem gluten'
  end

  scenario 'Unsuccessffuly' do
    visit new_preference_path

    click_on 'Cadastrar'

    expect(page).to have_content 'Por favor, verifique os dados obrigatórios'
  end
end
