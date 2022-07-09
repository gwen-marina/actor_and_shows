require 'rails_helper'

RSpec.describe 'the tv_shows show page' do 
  it 'displays all shows and their attributes' do
    actor = Actor.create!(name: "Bob Odenkirk", still_active: true, age: 59)
    tv_show = actor.tv_shows.create!(name: "Breaking Bad", on_air: false, number_of_episodes: 62)
    
    visit "/tvshows"
    
    expect(page).to have_content(tv_show.name)
    expect(page).to have_content(tv_show.on_air)
    expect(page).to have_content(tv_show.number_of_episodes)
  end
end