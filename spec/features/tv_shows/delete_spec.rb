require 'rails_helper'

RSpec.describe 'delete a tv show' do 
  
  it 'has a link to delete a tv show an redirects back to the index page' do 
    TvShow.destroy_all
    Actor.destroy_all
    actor = Actor.create!(name: "Bob Odenkirk", still_active: true, age: 59)
    tv_show_1 = actor.tv_shows.create!(name: "Better Call Saul", on_air: true, number_of_episodes: 57)
    tv_show_2 = actor.tv_shows.create!(name: "Mr. Show", on_air: false, number_of_episodes: 30)
    
    visit "/tvshows/#{tv_show_2.id}"

    expect(page).to have_link("Delete #{tv_show_2.name}")
    click_link "Delete #{tv_show_2.name}"

    expect(current_path).to eq('/tvshows')
    expect(page).to_not have_content("Mr. Show")
  end

  it 'every tv show has as link to delete on the index page' do 
    TvShow.destroy_all
    Actor.destroy_all
    actor_1 = Actor.create!(name: "Bob Odenkirk", still_active: true, age: 59)
    actor_2 = Actor.create!(name: "Bryan Cranston", still_active: true, age: 66)
    tv_show_1 = actor_1.tv_shows.create!(name: "Better Call Saul", on_air: true, number_of_episodes: 57)
    tv_show_2 = actor_1.tv_shows.create!(name: "Mr. Show", on_air: false, number_of_episodes: 30)
    tv_show_3 = actor_2.tv_shows.create!(name: "Breaking Bad", on_air: false, number_of_episodes: 62)

    visit '/tvshows'

    expect(page).to have_link("Delete #{tv_show_2.name}")

    click_link "Delete #{tv_show_2.name}"

    expect(current_path).to eq('/tvshows')
    expect(page).to_not have_content("Mr. Show")
  end

  it 'on the actors tv show page every tv show has as link to delete' do 
    TvShow.destroy_all
    Actor.destroy_all
    actor_1 = Actor.create!(name: "Bob Odenkirk", still_active: true, age: 59)
    actor_2 = Actor.create!(name: "Bryan Cranston", still_active: true, age: 66)
    tv_show_1 = actor_1.tv_shows.create!(name: "Better Call Saul", on_air: true, number_of_episodes: 57)
    tv_show_2 = actor_1.tv_shows.create!(name: "Mr. Show", on_air: false, number_of_episodes: 30)
    tv_show_3 = actor_2.tv_shows.create!(name: "Breaking Bad", on_air: false, number_of_episodes: 62)

    visit "/actors/#{actor_1.id}/tvshows"

    expect(page).to have_link("Delete #{tv_show_1.name}")

    click_link "Delete #{tv_show_1.name}"

    expect(current_path).to eq('/tvshows')
    expect(page).to_not have_content("Better Call Saul")
  end
end