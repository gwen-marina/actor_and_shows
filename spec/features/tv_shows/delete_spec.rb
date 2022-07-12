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
end