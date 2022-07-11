class TvShow < ApplicationRecord
  belongs_to :actor

  def self.on_air
    where(on_air: true) 
  end

  def self.alphabetical_order 
    order(name: :asc)
  end
end