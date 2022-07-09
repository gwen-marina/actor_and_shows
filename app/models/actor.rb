class Actor < ApplicationRecord 
  has_many :tv_shows

  def self.sort_by_newest
    order(created_at: :desc)  
  end

  def tv_show_count
     tv_shows.count
  end

  def actor_tv_shows 
    
  end
end