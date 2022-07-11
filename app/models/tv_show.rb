class TvShow < ApplicationRecord
  belongs_to :actor

  def self.on_air
    where(on_air: true) 
  end


end