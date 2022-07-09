require 'rails_helper'

RSpec.describe TvShow, type: :model do
  
  describe 'relationship' do 
    it {should belong_to :actor}
  end


end