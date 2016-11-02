require 'spec_helper'

feature 'View spaces' do
  scenario '' do
    list_a_space
    click_button 'Go to space'
    expect(page).to have_content('London Apartment')
    expect(page).to have_content('1 Bedroom Apartment, overlooking The River Thames')
    expect(page).to have_content('80.00')
  end
end