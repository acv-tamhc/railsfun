require 'rails_helper'

RSpec.describe Author, type: :model do
  describe 'validation' do
    it { should validate_presence_of(:name) }
  end
end
