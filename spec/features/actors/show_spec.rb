require 'rails_helper'

RSpec.describe 'the actors show page' do 

  it 'shows the name of all the actors' do
    actor_1 = Actor.create(name: "Bob Odenkirk", still_active: true, age: 59)
    actor_2 = Actor.create(name: "Bryan Cranston", still_active: true, age: 66)

    visit '/actors'

    expect(page).to have_content(actor_1.name)
    expect(page).to have_content(actor_2.name)  
  end
  
end