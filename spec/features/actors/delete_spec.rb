require 'rails_helper'

RSpec.describe 'delete an actor' do 
  
  it 'has a link to delete an actor on their show page and all shows and redirects to actor index' do 
    TvShow.destroy_all
    Actor.destroy_all
    actor = Actor.create!(name: "Bob Odenkirk", still_active: true, age: 59)
    better = actor.tv_shows.create!(name: "Better Call Saul", on_air: true, number_of_episodes: 57)
    show = actor.tv_shows.create!(name: "Mr. Show", on_air: false, number_of_episodes: 30)
    
    visit "/actors/#{actor.id}"

    expect(page).to have_link("Delete #{actor.name}")
    click_link "Delete #{actor.name}"

    expect(current_path).to eq('/actors')
    expect(page).to_not have_content("Bob Odenkirk")
  end
end