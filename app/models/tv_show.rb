class TvShow < ApplicationRecord
  belongs_to :actor

  validates_presence_of :name
  validates_presence_of :number_of_episodes
  validates_inclusion_of :on_air, :in => [true, false]

  def self.on_air
    where(on_air: true) 
  end

  def self.alphabetical_order 
    order(name: :asc)
  end

  def self.greater_than_number(number)
    #  binding.pry
    where("number_of_episodes > ?", number) 
  end
end