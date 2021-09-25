require 'rails_helper'
require './lib/modules/api_key'

RSpec.describe ApiKey do
  describe 'Creation' do
    it 'can generate a random 16 character key' do
      key = ApiKey.generator

      expect(key).to be_a(String)
      expect(key.length).to eq(24)
    end
  end
end
