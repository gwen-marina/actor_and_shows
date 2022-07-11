require 'rails_helper'

RSpec.describe 'the actor edit', type: :feature do 
  
  it 'links to the edit page' do 
    actor = Actor.create!(name: "Bob Odenkirk", still_active: true, age: 59)

    visit "/actors/#{actor.id}"

    click_link "Edit #{actor.name}" 

    expect(current_path). to eq("/actors/#{actor.id}/edit")
  end

  it 'can edit the actor' do 
    actor = Actor.create!(name: "Bob Odenkir", still_active: true, age: 59)

    visit "/actors/#{actor.id}"

    expect(page).to have_content('Bob Odenkir')
    
    click_link 'Edit Bob Odenkir'
 
    fill_in 'Name', with: 'Bob Odenkirk'
    click_button 'Update Actor'

    expect(current_path).to eq("/actors/#{actor.id}")
    expect(page).to have_content('Bob Odenkirk')
  end
end