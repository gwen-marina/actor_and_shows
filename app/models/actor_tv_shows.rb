class ActorTvShows < ApplicationRecord
  belongs_to :actor
  belongs_to :tv_show
end