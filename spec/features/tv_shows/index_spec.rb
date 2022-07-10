require 'rails_helper'
 
RSpec.describe 'tv show index', type: :feature do 

  it 'has link to actors index at top of page' do
    visit "/tvshows"
    expect(page).to have_link('Actors')
    click_link 'Actors'
    expect(current_path).to eq("/actors")
  end
end