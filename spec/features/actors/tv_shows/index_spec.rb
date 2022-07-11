
require 'rails_helper'

RSpec.describe 'Actors tv show index', type: :feature do 

it 'can create a new tv show' do 
    actor_1 = Actor.create!(name: "Bob Odenkirk", still_active: true, age: 59)
    tv_show_1 = actor_1.tv_shows.create!(name: "Better Call Saul", on_air: true, number_of_episodes: 57)
    tv_show_2 = actor_1.tv_shows.create!(name: "Mr. Show", on_air: false, number_of_episodes: 30)

    visit "/actors/#{actor_1.id}/tvshows/new"

    fill_in('name', with: 'Curb Your Enthusiasm')
    fill_in('on_air', with: 'True')
    fill_in('number_of_episodes', with: '110')
    click_button('Create TV Show')

    expect(current_path).to eq("/actors/#{actor_1.id}/tvshows")
    expect(page).to have_content('Curb Your Enthusiasm')
  end  
end
