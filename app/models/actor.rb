class Actor < ApplicationRecord 
  has_many :tv_shows

  def self.sort_by_newest
    order(created_at: :desc)  
  end
end