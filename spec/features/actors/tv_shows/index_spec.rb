
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

  it 'has an edit link for every tv show on the actor tv show page' do 
    actor_1 = Actor.create!(name: "Bob Odenkirk", still_active: true, age: 59)
    actor_2 = Actor.create!(name: "Bryan Cranston", still_active: true, age: 66)
    tv_show_1 = actor_1.tv_shows.create!(name: "Better Call Saul", on_air: true, number_of_episodes: 57)
    tv_show_2 = actor_1.tv_shows.create!(name: "Mr. Show", on_air: false, number_of_episodes: 30)
    tv_show_3 = actor_2.tv_shows.create!(name: "Breaking Bad", on_air: false, number_of_episodes: 62)

    visit "/actors/#{actor_2.id}/tvshows"

    click_link("Edit #{tv_show_3.name}")

    expect(current_path).to eq("/tvshows/#{tv_show_3.id}/edit")
  end

  it 'has a form and button to input number value' do 
    actor_1 = Actor.create!(name: "Bob Odenkirk", still_active: true, age: 59)
    tv_show_1 = actor_1.tv_shows.create!(name: "Better Call Saul", on_air: true, number_of_episodes: 57)
    tv_show_2 = actor_1.tv_shows.create!(name: "Mr. Show", on_air: false, number_of_episodes: 30)

    visit  "/actors/#{actor_1.id}/tvshows"

    fill_in 'number', with: '52'
    expect(page).to have_button('Only return TV Shows with more than a certain number of episodes')
  end

  it 'can show only tv shows with number of episodes more than x' do
    actor_1 = Actor.create!(name: "Bob Odenkirk", still_active: true, age: 59)
    tv_show_1 = actor_1.tv_shows.create!(name: "Better Call Saul", on_air: true, number_of_episodes: 57)
    tv_show_2 = actor_1.tv_shows.create!(name: "Mr. Show", on_air: false, number_of_episodes: 30)

    visit  "/actors/#{actor_1.id}/tvshows"

    fill_in 'number', with: '31'
    click_button 'Only return TV Shows with more than a certain number of episodes'
    
    expect(page).to have_content(tv_show_1.name)
    expect(page).to_not have_content(tv_show_2.name)
  end
end
