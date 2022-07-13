require 'rails_helper'

RSpec.describe 'the tv_shows show page', type: :feature do 

  it 'displays all shows and their attributes' do
    actor = Actor.create!(name: "Bob Odenkirk", still_active: true, age: 59)
    tv_show = actor.tv_shows.create!(name: "Better Call Saul", on_air: true, number_of_episodes: 57)
    
    visit "/tvshows"

    expect(page).to have_content(tv_show.name)
    expect(page).to have_content(tv_show.on_air)
    expect(page).to have_content(tv_show.number_of_episodes)
  end

   it 'can show a specific tv show and the attributes' do 
    actor_1 = Actor.create!(name: "Bob Odenkirk", still_active: true, age: 59)
    actor_2 = Actor.create!(name: "Bryan Cranston", still_active: true, age: 66)
    tv_show_1 = actor_1.tv_shows.create!(name: "Better Call Saul", on_air: true, number_of_episodes: 57)
    tv_show_2 = actor_2.tv_shows.create!(name: "Breaking Bad", on_air: false, number_of_episodes: 62)
    
    visit "/tvshows/#{tv_show_1.id}"

    expect(page).to have_content(tv_show_1.name)
    expect(page).to have_content(tv_show_1.on_air)
    expect(page).to have_content(tv_show_1.number_of_episodes) 
    expect(page).to_not have_content(tv_show_2.name) 
  end 
end