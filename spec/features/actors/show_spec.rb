require 'rails_helper'

RSpec.describe 'actors show page', type: :feature do 

  it 'shows the name of all the actors' do
    actor_1 = Actor.create!(name: "Bob Odenkirk", still_active: true, age: 59)
    sleep(1)
    actor_2 = Actor.create!(name: "Bryan Cranston", still_active: true, age: 66)

    visit '/actors'

    expect(page).to have_content(actor_1.name)
    expect(page).to have_content(actor_2.name)
    expect(page).to have_content(actor_1.created_at)
    expect(page).to have_content(actor_2.created_at)
  end

  it 'shows the count of tv_shows an actor has' do 
    actor_1 = Actor.create!(name: "Bob Odenkirk", still_active: true, age: 59)
    actor_1.tv_shows.create!(name: "Better Call Saul", on_air: true, number_of_episodes: 57)
    actor_1.tv_shows.create!(name: "Mr. Show", on_air: false, number_of_episodes: 30)

    visit "/actors/#{actor_1.id}"

    expect(page).to have_content(actor_1.name)
    expect(page).to have_content(actor_1.tv_show_count)
  end

  it 'can show a specific actor and their attributes' do 
    actor_1 = Actor.create!(name: "Bob Odenkirk", still_active: true, age: 59)
    actor_2 = Actor.create!(name: "Bryan Cranston", still_active: true, age: 66)

    visit "/actors/#{actor_1.id}"

    expect(page).to have_content(actor_1.name)
    expect(page).to have_content(actor_1.still_active)
    expect(page).to have_content(actor_1.age) 
    expect(page).to_not have_content(actor_2.age) 
  end  


  it 'has link to the actors tv shows index' do
    actor_1 = Actor.create!(name: "Bob Odenkirk", still_active: true, age: 59)
    actor_1.tv_shows.create!(name: "Better Call Saul", on_air: true, number_of_episodes: 57)
    actor_1.tv_shows.create!(name: "Mr. Show", on_air: false, number_of_episodes: 30)

    visit "/actors/#{actor_1.id}"

    expect(page).to have_link("#{actor_1.name}'s TV Shows")
    click_link "#{actor_1.name}'s TV Shows"
    expect(current_path).to eq("/actors/#{actor_1.id}/tvshows")
  end
end