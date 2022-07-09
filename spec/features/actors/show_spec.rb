require 'rails_helper'

RSpec.describe 'the actors show page', type: :feature do 

  it 'shows the name of all the actors' do
    actor_1 = Actor.create!(name: "Bob Odenkirk", still_active: true, age: 59)
    actor_2 = Actor.create!(name: "Bryan Cranston", still_active: true, age: 66)

    visit '/actors'

    expect(page).to have_content(actor_1.name)
    expect(page).to have_content(actor_2.name)  
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
end