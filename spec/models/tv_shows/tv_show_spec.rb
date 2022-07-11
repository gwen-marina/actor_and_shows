require 'rails_helper'

RSpec.describe TvShow, type: :model do
  
  describe 'relationship' do 
    it {should belong_to :actor}
  end

  describe 'class methods' do
    it 'only shows on_air tv shows' do
      TvShow.destroy_all
      Actor.destroy_all
      actor_1 = Actor.create!(name: "Bob Odenkirk", still_active: true, age: 59)
      better = actor_1.tv_shows.create!(name: "Better Call Saul", on_air: true, number_of_episodes: 57)
      mr = actor_1.tv_shows.create!(name: "Mr. Show", on_air: false, number_of_episodes: 30)

      expect(TvShow.on_air).to eq([better])
      expect(TvShow.on_air).not_to equal([mr])
    end
  
    it 'can sort an actors tv shows in alphabetical order' do 
      TvShow.destroy_all
      Actor.destroy_all
      actor_1 = Actor.create!(name: "Bob Odenkirk", still_active: true, age: 59)
      first = actor_1.tv_shows.create!(name: "Better Call Saul", on_air: true, number_of_episodes: 57)
      third = actor_1.tv_shows.create!(name: "Mr. Show", on_air: false, number_of_episodes: 30)
      second = actor_1.tv_shows.create!(name: "Breaking Bad", on_air: false, number_of_episodes: 62)

      tv_show = TvShow.alphabetical_order

      expect(TvShow.alphabetical_order).to eq([first, second, third])
    end
  end
end

