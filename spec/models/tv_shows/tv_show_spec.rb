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

      tv_show = TvShow.on_air

      expect(TvShow.on_air).to eq([better])
      expect(TvShow.on_air).not_to equal([mr])
    end
  end
end

