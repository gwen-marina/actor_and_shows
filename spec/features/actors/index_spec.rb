require 'rails_helper'

RSpec.describe 'the actor and tv_show index', type: :feature do 

  it 'shows a specific actor and their tv_shows and tv_shows attributes' do 
    actor_1 = Actor.create!(name: "Bob Odenkirk", still_active: true, age: 59)
    actor_2 = Actor.create!(name: "Bryan Cranston", still_active: true, age: 66)
    tv_show_1 = actor_1.tv_shows.create!(name: "Better Call Saul", on_air: true, number_of_episodes: 57)
    tv_show_2 = actor_1.tv_shows.create!(name: "Mr. Show", on_air: false, number_of_episodes: 30)
    tv_show_3 = actor_2.tv_shows.create!(name: "Breaking Bad", on_air: false, number_of_episodes: 62)

    visit "/actors/#{actor_1.id}/tvshows"
    
    expect(page).to have_content(tv_show_1.name)
    expect(page).to have_content(tv_show_1.on_air)
    expect(page).to have_content(tv_show_1.number_of_episodes)
    expect(page).to have_content(tv_show_2.name)
    expect(page).to have_content(tv_show_2.on_air)
    expect(page).to have_content(tv_show_2.number_of_episodes)
    expect(page).to_not have_content(tv_show_3.name)
  end
end