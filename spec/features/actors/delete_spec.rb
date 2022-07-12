require 'rails_helper'

RSpec.describe 'delete an actor', type: :feature do 
  
  it 'has a link to delete an actor on their show page and all actors shows and redirects to actor index' do 
    TvShow.destroy_all
    Actor.destroy_all
    actor = Actor.create!(name: 'Bob Odenkirk', still_active: true, age: 59)
    better = actor.tv_shows.create!(name: 'Better Call Saul', on_air: true, number_of_episodes: 57)
    show = actor.tv_shows.create!(name: 'Mr. Show', on_air: false, number_of_episodes: 30)
    
    visit "/actors/#{actor.id}"

    expect(page).to have_link("Delete #{actor.name}")
    click_link "Delete #{actor.name}"

    expect(current_path).to eq('/actors')
    expect(page).to_not have_content('Bob Odenkirk')
  end

  it 'every actor has as link to delete on the index page' do 
    TvShow.destroy_all
    Actor.destroy_all
    actor_1 = Actor.create!(name: "Bob Odenkirk", still_active: true, age: 59)
    actor_2 = Actor.create!(name: "Bryan Cranston", still_active: true, age: 66)
    tv_show_1 = actor_1.tv_shows.create!(name: "Better Call Saul", on_air: true, number_of_episodes: 57)
    tv_show_2 = actor_1.tv_shows.create!(name: "Mr. Show", on_air: false, number_of_episodes: 30)
    tv_show_3 = actor_2.tv_shows.create!(name: "Breaking Bad", on_air: false, number_of_episodes: 62)

    visit '/actors'

    expect(page).to have_link("Delete #{actor_2.name}")

    click_link "Delete #{actor_2.name}"

    expect(current_path).to eq('/actors')
    expect(page).to_not have_content('Bryan Cranston')
  end
end