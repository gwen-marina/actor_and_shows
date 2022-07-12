require 'rails_helper' 

RSpec.describe 'the tv show edit', type: :feature do 

  it 'links to the edit page' do 
    actor = Actor.create!(name: "Bryan Cranston", still_active: true, age: 66)
    tv_show_1 = actor.tv_shows.create!(name: "Breaking Bad", on_air: false, number_of_episodes: 62)
    tv_show_2 = actor.tv_shows.create!(name: "Malcolm in the Middle", on_air: false, number_of_episodes: 151)

    visit "/tvshows/#{tv_show_1.id}"
    
    click_link "Edit #{tv_show_1.name}"
    
    expect(current_path).to eq("/tvshows/#{tv_show_1.id}/edit")
  end

   it 'can edit the tv show' do 
    actor = Actor.create!(name: "Bryan Cranston", still_active: true, age: 66)
    tv_show_1 = actor.tv_shows.create!(name: "Breaking Bad", on_air: false, number_of_episodes: 62)
    tv_show_2 = actor.tv_shows.create!(name: "Malcolm in the Middle", on_air: false, number_of_episodes: 151)

    visit "/tvshows/#{tv_show_1.id}"

    expect(page).to have_content('Breaking Ba')
  
    click_link 'Edit Breaking Ba'
    
    fill_in 'Name', with: 'Breaking Bad'
    click_button 'Update TV Show'

    expect(current_path).to eq("/tvshows/#{tv_show_1.id}")
    expect(page).to have_content('Breaking Bad')
  end

end