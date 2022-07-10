require 'rails_helper'

RSpec.describe 'the Actor creation' do

  it 'links to the new page from the actor index' do 
    visit '/actors'

    click_link ('New Actor')
    expect(current_path).to eq('/actors/new')
  end
 
  it 'can create a new actor' do 
    visit '/actors/new'

    fill_in('name', with: 'Rhea Seehorn')
    fill_in('still_active', with: 'True')
    fill_in('age', with: '48')
    click_button('Create Actor')

    new_actor_id = Actor.last.id
    expect(current_path).to eq("/actors/#{new_actor_id}")
    expect(page).to have_content('Rhea Seehorn')
  end
end