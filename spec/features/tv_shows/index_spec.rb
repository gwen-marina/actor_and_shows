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
    
    expect(page).to have_link('Sort TV Shows By Alphabetical Order')

    click_link 'Sort TV Shows By Alphabetical Order'

    expect(current_path).to eq("/actors/#{actor_1.id}/tvshows")
  end

  it 'has a link for every tv show to edit the information' do 
    TvShow.destroy_all 
    Actor.destroy_all
    actor_1 = Actor.create!(name: "Bob Odenkirk", still_active: true, age: 59)
    actor_2 = Actor.create!(name: "Bryan Cranston", still_active: true, age: 66)
    tv_show_1 = actor_1.tv_shows.create!(name: "Better Call Saul", on_air: true, number_of_episodes: 57)
    tv_show_2 = actor_1.tv_shows.create!(name: "Mr. Show", on_air: false, number_of_episodes: 30)
    tv_show_3 = actor_2.tv_shows.create!(name: "Breaking Bad", on_air: false, number_of_episodes: 62)

    visit '/tvshows'

    click_link("Edit #{tv_show_1.name}")

    expect(current_path).to eq("/tvshows/#{tv_show_1.id}/edit")
  end

  it 'only shows on_air tv shows' do
    TvShow.destroy_all
    Actor.destroy_all
    actor_1 = Actor.create!(name: "Bob Odenkirk", still_active: true, age: 59)
    actor_2 = Actor.create!(name: "Bryan Cranston", still_active: true, age: 66)
    tv_show_1 = actor_1.tv_shows.create!(name: "Better Call Saul", on_air: true, number_of_episodes: 57)
    tv_show_2 = actor_1.tv_shows.create!(name: "Mr. Show", on_air: false, number_of_episodes: 30)
    tv_show_3 = actor_2.tv_shows.create!(name: "Breaking Bad", on_air: false, number_of_episodes: 62)

    visit '/tvshows'
   
    expect(page).to_not have_content(false)
  end
end