require 'rails_helper'

RSpec.describe 'Actor index', type: :model do 

  it 'shows most recent actor and when created' do
    actor_1 = Actor.create!(name: "Bob Odenkirk", still_active: true, age: 59)
    sleep(1)
    actor_2 = Actor.create!(name: "Bryan Cranston", still_active: true, age: 66)
   
    actors = Actor.sort_by_newest
    
    expect(actors[0]).to eq(actor_2)
    expect(actors[1]).to eq(actor_1)
  end
end