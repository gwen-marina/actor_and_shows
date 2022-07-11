require 'rails_helper'
 
RSpec.describe 'tv show index', type: :feature do 

  it 'has link to actors index at top of page' do
    visit '/tvshows'

    expect(page).to have_link('Actors')

    click_link 'Actors'

    expect(current_path).to eq('/actors')
  end

  it 'has a link to sort by alphabetical order' do 
    actor_1 = Actor.create!(name: "Bob Odenkirk", still_active: true, age: 59)
    first = actor_1.tv_shows.create!(name: "Better Call Saul", on_air: true, number_of_episodes: 57)
    third = actor_1.tv_shows.create!(name: "Mr. Show", on_air: false, number_of_episodes: 30)
    second = actor_1.tv_shows.create!(name: "Breaking Bad", on_air: false, number_of_episodes: 62)

    visit "/actors/#{actor_1.id}/tvshows"
    
    expect(page).to have_link('Sort By Alphabetical Order')

    click_link 'Sort By Alphabetical Order'

    expect(current_path).to eq("/actors/#{actor_1.id}/tvshows")
  end
end