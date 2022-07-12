require 'rails_helper'

RSpec.describe Actor, type: :model do 

  describe 'relationships' do
    it {should have_many :tv_shows}
  end

  describe 'validations' do
    it { should validate_presence_of :name }
    it { should validate_presence_of :age}
    it { should allow_value(true).for :still_active}
    it { should allow_value(false).for :still_active}
    it { should_not allow_value(nil).for :still_active}
  end

  describe 'class methods' do
    it 'shows most recent actor and when created' do
      actor_1 = Actor.create!(name: "Bob Odenkirk", still_active: true, age: 59)
      sleep(1)
      actor_2 = Actor.create!(name: "Bryan Cranston", still_active: true, age: 66)
   
      actors = Actor.sort_by_newest
    
      expect(actors[0]).to eq(actor_2)
      expect(actors[1]).to eq(actor_1)
    end
  end

  describe 'instance methods' do
    it 'shows a tv_show count for each actor' do 
      actor_1 = Actor.create!(name: "Bob Odenkirk", still_active: true, age: 59)
      actor_2 = Actor.create!(name: "Bryan Cranston", still_active: true, age: 66)

      actor_2.tv_shows.create!(name: "Breaking Bad", on_air: false, number_of_episodes: 62)
      actor_1.tv_shows.create!(name: "Better Call Saul", on_air: true, number_of_episodes: 57)
      actor_1.tv_shows.create!(name: "Mr. Show", on_air: false, number_of_episodes: 30)

      expect(actor_1.tv_show_count).to eq(2)
      expect(actor_2.tv_show_count).to eq(1)
    end
  end
end