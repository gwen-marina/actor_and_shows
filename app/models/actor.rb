class Actor < ApplicationRecord 
  has_many :tv_shows
  has_many :tv_shows,  dependent: :destroy 

  validates_presence_of :name
  validates_presence_of :age
  validates_inclusion_of :still_active, :in => [true, false]

  def self.sort_by_newest
    order(created_at: :desc)  
  end

  def tv_show_count
   tv_shows.count
  end
end