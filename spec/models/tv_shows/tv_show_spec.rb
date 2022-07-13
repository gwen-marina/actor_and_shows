require 'rails_helper'

RSpec.describe TvShow, type: :model do
  
  describe 'relationship' do 
    it {should belong_to :actor}
  end

  describe 'validations' do
    it { should validate_presence_of :name }
    it { should validate_presence_of :number_of_episodes}
    it { should allow_value(true).for :on_air}
    it { should allow_value(false).for :on_air}
    it { should_not allow_value(nil).for :on_air}
  end

  describe 'class methods' do
    it 'only shows on_air tv shows' do
      TvShow.destroy_all
      actor_1 = Actor.create!(name: "Bob Odenkirk", still_active: true, age: 59)
      better = actor_1.tv_shows.create!(name: "Better Call Saul", on_air: true, number_of_episodes: 57)
      mr = actor_1.tv_shows.create!(name: "Mr. Show", on_air: false, number_of_episodes: 30)

      expect(TvShow.on_air).to eq([better])
      expect(TvShow.on_air).not_to equal([mr])
    end
  
    it 'can sort an actors tv shows in alphabetical order' do 
      TvShow.destroy_all
      actor_1 = Actor.create!(name: "Bob Odenkirk", still_active: true, age: 59)
      first = actor_1.tv_shows.create!(name: "Better Call Saul", on_air: true, number_of_episodes: 57)
      third = actor_1.tv_shows.create!(name: "Mr. Show", on_air: false, number_of_episodes: 30)
      second = actor_1.tv_shows.create!(name: "Breaking Bad", on_air: false, number_of_episodes: 62)

      expect(TvShow.alphabetical_order).to eq([first, second, third])
    end

    it 'can filter tv shows based on number of episodes' do
      TvShow.destroy_all
      actor_1 = Actor.create!(name: "Bob Odenkirk", still_active: true, age: 59)
      tv_show_1 = actor_1.tv_shows.create!(name: "Better Call Saul", on_air: true, number_of_episodes: 57)
      tv_show_2 = actor_1.tv_shows.create!(name: "Mr. Show", on_air: false, number_of_episodes: 30)

      expect(TvShow.greater_than_number(37)).to eq([tv_show_1]) 
    end
  end
end

